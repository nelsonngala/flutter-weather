part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoaded({
    required this.weatherModel,
  });
  @override
  List<Object?> get props => [weatherModel];
}

class WeatherError extends WeatherState {
  final String error;
  const WeatherError({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}
