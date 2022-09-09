import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/widgets/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(theme: AppTheme.lightTheme)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeToggledEvent) {
        emit(ThemeState(
            theme: state.theme == AppTheme.lightTheme
                ? AppTheme.darkTheme
                : AppTheme.lightTheme));
      }
    });
  }
}
