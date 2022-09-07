import 'package:advanced_weather/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErrorWeather extends StatelessWidget {
  final String error;
  const ErrorWeather({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: style(),
      ),
    );
  }
}
