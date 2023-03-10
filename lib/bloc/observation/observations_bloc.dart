import 'package:admin/models/model.dart';
import 'package:admin/models/observation.dart';
import 'package:admin/models/filter.dart';
import 'package:admin/models/sort.dart';
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
    on<ObservationsSubcriptionEvent>(_onObservationSubscription);
  }

  Future<void> _onObservationSubscription(ObservationsSubcriptionEvent event,
      Emitter<ObservationsState> emit) async {
    emit(state.copyWith(status: ModelStatus.loading));
    try {
      final observations = await observationRepository.getObservations();
      emit(state.copyWith(observations: observations));
      emit(state.copyWith(status: ModelStatus.succuess));
    } catch (e) {
      emit(state.copyWith(status: ModelStatus.failure));
    }
  }
}
