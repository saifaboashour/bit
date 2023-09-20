import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppConstants {
  //Fonts
  static const fontFamily = "ibm_plex_sans_arabic";

  //Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: fontFamily,
  );

  //Api Url
  // static String baseUrl = "";

  //App Configuration
  static const Duration splashScreenTimeout = Duration(seconds: 2);
}
