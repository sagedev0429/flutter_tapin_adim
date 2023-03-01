abstract class Model {
  Map<String, dynamic> visibleItemsToMap();
}

enum ModelStatus {
  initial,
  loading,
  succuess,
  failure,
}
