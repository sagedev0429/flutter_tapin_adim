part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UsersSubcriptionEvent extends UsersEvent {}

class UsersFilterEvent extends UsersEvent {}
