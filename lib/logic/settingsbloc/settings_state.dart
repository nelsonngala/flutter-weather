part of 'settings_bloc.dart';

enum TemperatureUnits { fahrenheit, celsius }

class SettingsState extends Equatable {
  final TemperatureUnits temperatureUnits;
  const SettingsState({
    required this.temperatureUnits,
  });

  @override
  List<Object?> get props => [temperatureUnits];
}
