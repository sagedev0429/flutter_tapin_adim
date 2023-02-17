// ignore_for_file: public_member_api_docs, sort_constructors_first
import './../models/observation.dart';

enum Comparer {
  isEqual,
}

class ObservationFilterItem {
  final Comparer comparer;
  final String left;
  final String right;
  ObservationFilterItem({
    required this.comparer,
    required this.left,
    required this.right,
  });

  bool apply(Observation observation) {
    final observationMap = observation.toMap();
    switch (comparer) {
      case Comparer.isEqual:
        return observationMap[left] == right;
    }
  }
}

class ObservationFilter {
  final List<ObservationFilterItem> filterItems;
  const ObservationFilter({
    this.filterItems = const [],
  });

  List<Observation> applyAll(List<Observation> observations) {
    return observations
        .where(
          (observation) => filterItems.every(
            (filterItem) => filterItem.apply(observation),
          ),
        )
        .toList();
  }
}
