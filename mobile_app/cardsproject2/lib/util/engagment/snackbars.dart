import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBars {
  static showError(String error) {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Something went wrong!',
        message: error,
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
