import 'package:advanced_weather/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class AppUtilities {
  static Color appbarColor = const Color(0xff18187b);
  static Color textColor = const Color(0xff9a9aa4);
  static Color numColor = const Color(0xffFafafb);
  static Color themeColor = Colors.indigo.shade900;
  static Color darkThemeColor = Colors.black54;
  static String appbarText = 'World Weather';
  static Icon settingsIcon = const Icon(Icons.settings);
  static Icon searchIcon = const Icon(Icons.search);
}

searchButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => const SearchScreen())),
      );
    },
    icon: AppUtilities.searchIcon,
  );
}

settingsButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => const SettingsScreen())),
      );
    },
    icon: AppUtilities.settingsIcon,
  );
}
