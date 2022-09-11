import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(temperatureUnits: TemperatureUnits.celsius)) {
    on<SettingsEvent>((event, emit) {
      final currentState = state;
      if (event is TemperatureToggledEvent) {
        emit(SettingsState(
          temperatureUnits:
              currentState.temperatureUnits == TemperatureUnits.celsius
                  ? TemperatureUnits.fahrenheit
                  : TemperatureUnits.celsius,
        ));
      }
    });
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState(
      temperatureUnits: TemperatureUnits.values[json['value'] as int],
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {'value': state.temperatureUnits.index};
  }
}
