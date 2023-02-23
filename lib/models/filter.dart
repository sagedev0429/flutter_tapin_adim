// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/models/model.dart';
enum Comparer {
  isEqual,
}

class FilterItem {
  final Comparer comparer;
  final String left;
  final String right;
  FilterItem({
    required this.comparer,
    required this.left,
    required this.right,
  });

  bool apply(Model model) {
    final modelMap = model.toMap();
    switch (comparer) {
      case Comparer.isEqual:
        return modelMap[left] == right;
    }
  }
}

class Filter {
  final List<FilterItem> filterItems;
  const Filter({
    this.filterItems = const [],
  });

  List<Model> applyAll(List<Model> models) {
    return models
        .where(
          (model) => filterItems.every(
            (filterItem) => filterItem.apply(model),
          ),
        )
        .toList();
  }
}
