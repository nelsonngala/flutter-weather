import 'package:advanced_weather/data/models/weather_model.dart';
import 'package:equatable/equatable.dart';

import 'package:advanced_weather/data/weather%20data/open_weather_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherData _weatherData;
  WeatherBloc(
    this._weatherData,
  ) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      try {
        if (event is WeatherLoadingEvent) {
          emit(WeatherLoading());
          WeatherModel? apiData =
              await _weatherData.getWeather(event.lat, event.lon);
          if (apiData == null) {
            emit(const WeatherError(
                error:
                    'Sorry, it appears there is no data for that location at the moment. Please try again later.'));
          } else {
            emit(WeatherLoaded(weatherModel: apiData));
          }
        }
      } catch (e) {
        emit(const WeatherError(
            error: 'Something went wrong, please try again later.'));
      }
    });
    on<RefreshWeatherEvent>((event, emit) async {
      try {
        WeatherModel? apiData =
            await _weatherData.getWeather(event.lat, event.lon);
        if (apiData == null) {
          emit(const WeatherError(
              error:
                  'Sorry, it appears there is no data for that location at the moment. Please try again later.'));
        } else {
          emit(WeatherLoaded(weatherModel: apiData));
        }
      } catch (e) {
        emit(const WeatherError(
            error: 'Something went wrong, please try again later.'));
      }
    });
  }
}
