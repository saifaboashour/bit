import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes.dart';
import '../services/first_time_service.dart';

class AuthenticationGuard extends GetMiddleware {
  final firstTimeService = Get.find<FirstTimeService>();

  @override
  RouteSettings? redirect(String? route) {
    return firstTimeService.isFirstTime
        ? null
        : const RouteSettings(name: Routes.home);
  }
}
