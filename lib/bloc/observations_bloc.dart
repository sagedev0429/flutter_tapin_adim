import 'package:admin/models/observation.dart';
import 'package:admin/models/observation_filter.dart';
import 'package:admin/models/observation_sort.dart';
import 'package:admin/repositories/observation_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'observations_event.dart';
part 'observations_state.dart';

class ObservationsBloc extends Bloc<ObservationsEvent, ObservationsState> {
  final ObservationRepository observationRepository;
  ObservationsBloc({
    required this.observationRepository,
  }) : super(const ObservationsState()) {
    on<ObservatioinSubscriptionEvent>(_onObservationSubscription);
  }

  Future<void> _onObservationSubscription(ObservatioinSubscriptionEvent event,
      Emitter<ObservationsState> emit) async {
    emit(state.copyWith(status: ObservationsStatus.loading));
    try {
      final observations = await observationRepository.getObservations();
      emit(state.copyWith(observations: observations));
      emit(state.copyWith(status: ObservationsStatus.succuess));
    } catch (e) {
      emit(state.copyWith(status: ObservationsStatus.failure));
    }
  }
}
