import 'package:flutter/material.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
