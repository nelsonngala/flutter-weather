import 'package:advanced_weather/presentation/widgets/app_utilities.dart';
import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppUtilities.themeColor,
  ),
  AppTheme.darkTheme: ThemeData(
      brightness: Brightness.dark, primaryColor: AppUtilities.darkThemeColor)
};
