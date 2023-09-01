import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module/onboarding/splash/splash_screen_view.dart';
import 'util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitaqaty',
      theme: AppConstants.lightTheme,
      home: SplashScreen(),
    );
  }
}
