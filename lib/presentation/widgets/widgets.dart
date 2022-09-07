import 'package:advanced_weather/presentation/widgets/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

style() {
  return GoogleFonts.lato(color: AppUtilities.textColor);
}

descStyle(FontWeight fontWeight) {
  return TextStyle(fontWeight: fontWeight, color: AppUtilities.textColor);
}
