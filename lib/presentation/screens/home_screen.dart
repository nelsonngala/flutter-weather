import 'package:advanced_weather/logic/weatherbloc/weather_bloc.dart';
import 'package:advanced_weather/presentation/widgets/app_utilities.dart';
import 'package:advanced_weather/presentation/widgets/weatherWidgets/error_weather.dart';
import 'package:advanced_weather/presentation/widgets/weatherWidgets/initial_weather.dart';
import 'package:advanced_weather/presentation/widgets/weatherWidgets/loaded_weather.dart';
import 'package:advanced_weather/presentation/widgets/weatherWidgets/loading_weather.dart';
import 'package:advanced_weather/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppUtilities.appbarText,
          style: style(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: AppUtilities.textColor,
        actions: [settingsButton(context), searchButton(context)],
        elevation: 0.0,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const InitialWeather();
          }
          if (state is WeatherLoading) {
            return const LoadingWeather();
          }
          if (state is WeatherLoaded) {
            return LoadedWeather(weatherModel: state.weatherModel);
          }
          if (state is WeatherError) {
            return ErrorWeather(error: state.error);
          }
          return Container();
        },
      ),
    );
  }
}
