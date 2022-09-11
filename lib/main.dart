import 'package:advanced_weather/data/geo%20location%20data/geo_location.dart';
import 'package:advanced_weather/data/user%20location%20data/userloc.dart';
import 'package:advanced_weather/data/weather%20data/open_weather_api.dart';

import 'package:advanced_weather/logic/settingsbloc/settings_bloc.dart';
import 'package:advanced_weather/logic/useLocbloc/user_loc_bloc.dart';

import 'package:advanced_weather/presentation/screens/home_screen.dart';
import 'package:advanced_weather/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/geobloc/geo_bloc.dart';
import 'logic/themebloc/theme_bloc.dart';
import 'logic/weatherbloc/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(WeatherData()),
        ),
        BlocProvider(
          create: (context) => GeoBloc(GeolocData()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => UserLocBloc(CurrentLocation())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: appThemeData[state.theme],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
