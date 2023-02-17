// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'observation.dart';

class ObservationSortItem {
  final String name;
  final bool direction;
  const ObservationSortItem({
    required this.name,
    required this.direction,
  });
}

class ObservationSort {
  final List<ObservationSortItem> sortItems;

  const ObservationSort({
    this.sortItems = const [],
  });

  List<Observation> applyAll(List<Observation> observations) {
    List<Observation> sortedObservations = [...observations];
    if (sortedObservations.length > 1) {
      sortedObservations.sort((first, second) {
        final firstMap = first.toMap();
        final secondMap = second.toMap();
        int result;
        for (var i = 0; i < observations.length; i++) {
          result = compare(i, firstMap, secondMap);
          if (result != 0) break;
        }
        return 0;
      });
    }

    return sortedObservations;
  }

  int compare(int i, dynamic first, dynamic second) {
    if (first[sortItems[i].name] == second[sortItems[i].name]) {
      return 0;
    } else if (first[sortItems[i].name] > second[sortItems[i].name]) {
      return sortItems[i].direction ? 1 : -1;
    } else {
      return sortItems[i].direction ? -1 : 1;
    }
  }
}
