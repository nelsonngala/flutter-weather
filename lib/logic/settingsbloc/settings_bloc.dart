import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(temperatureUnits: TemperatureUnits.celsius)) {
    on<SettingsEvent>((event, emit) {
      final currentState = state;
      if (event is TemperatureToggledEvent) {
        emit(SettingsState(
            temperatureUnits:
                currentState.temperatureUnits == TemperatureUnits.celsius
                    ? TemperatureUnits.fahrenheit
                    : TemperatureUnits.celsius));
      }
    });
  }
}
