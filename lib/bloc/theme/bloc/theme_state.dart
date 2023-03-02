part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isMenuExtended;
  final int menuIndex;
  const ThemeState({
    this.isMenuExtended = true,
    this.menuIndex = 1,
  });

  @override
  List<Object> get props => [
        isMenuExtended,
        menuIndex,
      ];

  ThemeState copyWith({
    bool? isMenuExtended,
    int? menuIndex,
  }) {
    return ThemeState(
      isMenuExtended: isMenuExtended ?? this.isMenuExtended,
      menuIndex: menuIndex ?? this.menuIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isMenuExtended': isMenuExtended,
      'menuIndex': menuIndex,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isMenuExtended: map['isMenuExtended'] as bool,
      menuIndex: map['menuIndex'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ThemeState.fromJson(String source) => ThemeState.fromMap(json.decode(source) as Map<String, dynamic>);
}
