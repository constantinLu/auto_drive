part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _Initial;

  const factory ThemeState.toggle({required bool isDarkMode}) = _ToggleDarkMode;
}
