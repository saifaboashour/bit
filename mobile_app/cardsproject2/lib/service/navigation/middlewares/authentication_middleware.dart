import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes.dart';
import '../services/authentication_service.dart';

class AuthenticationGuard extends GetMiddleware {
  final authService = Get.find<AuthenticationService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isLoggedIn
        ? null
        : const RouteSettings(name: Routes.login);
  }
}
