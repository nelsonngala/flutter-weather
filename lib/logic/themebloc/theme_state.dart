part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme theme;
  const ThemeState({
    required this.theme,
  });

  @override
  List<Object> get props => [theme];
}
