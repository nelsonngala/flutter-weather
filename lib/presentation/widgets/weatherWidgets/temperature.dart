import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:advanced_weather/logic/settingsbloc/settings_bloc.dart';

class Temperature extends StatelessWidget {
  final FontWeight weight;
  final double fontSize;
  final Color color;
  final double temperature;
  final TemperatureUnits units;
  const Temperature({
    Key? key,
    required this.weight,
    required this.fontSize,
    required this.color,
    required this.temperature,
    required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_formattedTemperature(temperature)}°${units == TemperatureUnits.celsius ? "C" : "F"}',
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();
  int _formattedTemperature(double t) =>
      units == TemperatureUnits.fahrenheit ? _toFahrenheit(t) : t.round();
}
