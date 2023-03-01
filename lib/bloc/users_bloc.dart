import 'package:admin/models/model.dart';
import 'package:admin/models/user.dart';
import 'package:admin/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;
  UsersBloc({required this.userRepository}) : super(const UsersState()) {
    on<UsersSubcriptionEvent>(_onUsersSubscription);
  }

  Future<void> _onUsersSubscription(
      UsersSubcriptionEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: ModelStatus.loading));
    try {
      final users = await userRepository.getUsers();
      emit(state.copyWith(users: users));
      emit(state.copyWith(status: ModelStatus.succuess));
    } catch (e) {
      emit(state.copyWith(status: ModelStatus.failure));
    }
  }
}
