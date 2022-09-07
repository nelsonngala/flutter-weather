part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherLoadingEvent extends WeatherEvent {
  final double lat;
  final double lon;
  const WeatherLoadingEvent({required this.lat, required this.lon});
  @override
  List<Object?> get props => [lat, lon];
}

class RefreshWeatherEvent extends WeatherEvent {
  final double lat;
  final double lon;
  const RefreshWeatherEvent({required this.lat, required this.lon});
  @override
  List<Object?> get props => [lat, lon];
}
