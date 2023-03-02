import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeMenuCollpased>(_onThemeMenuCollapsed);
    on<ThemeMenuSelected>(_onMenuSelected);
  }

  void _onThemeMenuCollapsed(
      ThemeMenuCollpased event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      isMenuExtended: event.isMenuExtended,
    ));
  }

  void _onMenuSelected(ThemeMenuSelected event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      menuIndex: event.menuIndex,
    ));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
