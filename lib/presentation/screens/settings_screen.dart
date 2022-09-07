import 'package:advanced_weather/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/theme_bloc.dart';
import '../../logic/settingsbloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return ListTile(
                title: const Text('Temperature units'),
                isThreeLine: true,
                subtitle: const Text(
                    'Use metric measurements for temperature units.'),
                trailing: Switch(
                    value: state.temperatureUnits == TemperatureUnits.celsius,
                    onChanged: ((value) {
                      BlocProvider.of<SettingsBloc>(context)
                          .add(TemperatureToggledEvent());
                    })),
              );
            },
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return ListTile(
                title: const Text('Change App Theme'),
                trailing: Switch(
                    value: state.theme == AppTheme.darkTheme,
                    onChanged: (value) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeToggledEvent());
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
