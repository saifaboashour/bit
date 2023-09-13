import 'package:cardsproject2/service/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'service/navigation/routes.dart';
import 'service/navigation/services/first_time_service.dart';
import 'util/constants.dart';
import 'translation/localizations.dart' as languages;

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // await Get.putAsync(() => AuthenticationService().init());
  await Get.putAsync(() => FirstTimeService().init());

  runApp(const BitaqatyApp());
}

class BitaqatyApp extends StatelessWidget {
  const BitaqatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitaqaty',
      theme: AppConstants.lightTheme,
      translations: languages.Localizations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      getPages: NavigationController.appPages,
      textDirection: TextDirection.ltr,
      initialRoute: Routes.splash,
    );
  }
}
