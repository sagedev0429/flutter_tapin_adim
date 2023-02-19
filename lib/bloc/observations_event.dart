part of 'observations_bloc.dart';

abstract class ObservationsEvent extends Equatable {
  const ObservationsEvent();

  @override
  List<Object> get props => [];
}

class ObservationsSubcriptionEvent extends ObservationsEvent {}

class ObservationFilterEvent extends ObservationsEvent {}
