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

List<Observation> initialObservations = <Observation>[
  Observation(
    company: 'Company1',
    date: DateTime(2000),
    name: 'name1',
    description: 'description1',
    project: 'project1',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company3',
    date: DateTime(2000),
    name: 'name2',
    description: 'description2',
    project: 'project2',
    type: ObservationType.unsafe,
  ),
  Observation(
    company: 'Company1',
    date: DateTime(2000),
    name: 'name3',
    description: 'description3',
    project: 'project2',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company4',
    date: DateTime(2000),
    name: 'name4',
    description: 'description4',
    project: 'project3',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company4',
    date: DateTime(2000),
    name: 'name5',
    description: 'description5',
    project: 'project5',
    type: ObservationType.unsafe,
  ),
  Observation(
    company: 'Company3',
    date: DateTime(2000),
    name: 'name6',
    description: 'description6',
    project: 'project4',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company2',
    date: DateTime(2000),
    name: 'name7',
    description: 'description7',
    project: 'project2',
    type: ObservationType.unsafe,
  ),
  Observation(
    company: 'Company3',
    date: DateTime(2000),
    name: 'name8',
    description: 'description8',
    project: 'project1',
    type: ObservationType.unsafe,
  ),
  Observation(
    company: 'Company5',
    date: DateTime(2000),
    name: 'name9',
    description: 'description9',
    project: 'project4',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company2',
    date: DateTime(2000),
    name: 'name10',
    description: 'description10',
    project: 'project5',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company6',
    date: DateTime(2000),
    name: 'name11',
    description: 'description11',
    project: 'project2',
    type: ObservationType.unsafe,
  ),
  Observation(
    company: 'Company2',
    date: DateTime(2000),
    name: 'name12',
    description: 'description12',
    project: 'project4',
    type: ObservationType.safe,
  ),
  Observation(
    company: 'Company3',
    date: DateTime(2000),
    name: 'name13',
    description: 'description13',
    project: 'project3',
    type: ObservationType.safe,
  ),
];