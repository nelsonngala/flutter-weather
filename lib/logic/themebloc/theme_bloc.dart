import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../presentation/widgets/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(theme: AppTheme.lightTheme)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeToggledEvent) {
        emit(ThemeState(
          theme: state.theme == AppTheme.lightTheme
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
        ));
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(theme: AppTheme.values[json['value'] as int]);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'value': state.theme.index};
  }
}
