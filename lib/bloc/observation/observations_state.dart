// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'observations_bloc.dart';

class ObservationsState extends Equatable {
  final ModelStatus status;
  final List<Observation> observations;
  final Filter filter;
  final Sort sort;
  const ObservationsState({
    this.status = ModelStatus.initial,
    this.observations = const [],
    this.filter = const Filter(),
    this.sort = const Sort(),
  });

  List<Model> get filteredObservations => filter.applyAll(sortedObservations);

  List<Model> get sortedObservations => sort.applyAll(observations);

  @override
  List<Object> get props => [
        status,
        observations,
        filter,
      ];

  ObservationsState copyWith({
    ModelStatus? status,
    List<Observation>? observations,
    Filter? filter,
    Sort? sort,
  }) {
    return ObservationsState(
      status: status ?? this.status,
      observations: observations ?? this.observations,
      filter: filter ?? this.filter,
      sort: sort ?? this.sort,
    );
  }
}
