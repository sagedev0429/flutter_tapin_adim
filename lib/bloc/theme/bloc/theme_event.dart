// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeMenuCollpased extends ThemeEvent {
  final bool isMenuExtended;
  const ThemeMenuCollpased({
    required this.isMenuExtended,
  });
}

class ThemeMenuSelected extends ThemeEvent {
  final int menuIndex;
  const ThemeMenuSelected({
    required this.menuIndex,
  });
}