// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'model.dart';

class SortItem {
  final String name;
  final bool direction;
  const SortItem({
    required this.name,
    required this.direction,
  });
}

class Sort {
  final List<SortItem> sortItems;

  const Sort({
    this.sortItems = const [],
  });

  List<Model> applyAll(List<Model> lists) {
    List<Model> sortedLists = [...lists];
    if (sortedLists.length > 1) {
      sortedLists.sort((first, second) {
        final firstMap = first.toMap();
        final secondMap = second.toMap();
        int result;
        for (var i = 0; i < lists.length; i++) {
          result = compare(i, firstMap, secondMap);
          if (result != 0) break;
        }
        return 0;
      });
    }

    return sortedLists;
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
