import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  //Fonts
  static const fontFamily = "ibm_plex_sans_arabic";

  //Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: fontFamily,
  );

  //Api Url
  static String baseUrl = "https://bitaqty.adamsabbah.com";

  //Http Client Config
  static const Duration requestTimeout = Duration(seconds: 2);

  //App Configuration
  static const Duration splashScreenTimeout = Duration(seconds: 2);
}
