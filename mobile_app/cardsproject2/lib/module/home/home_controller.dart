import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Declerations
  final RxInt _selectedCategory = 0.obs;
  final Rx<ScrollController> _newsScrollController = ScrollController().obs;
  final RxInt _currentNewsIndex = 0.obs;
  late Timer? _newsScrollTimer;

  //Getters
  int get selectedCategory => _selectedCategory.value;
  ScrollController get newsScrollController => _newsScrollController.value;
  int get currentNewsIndex => _currentNewsIndex.value;

  //Logic
  @override
  onInit() {
    super.onInit();
    _startNewsAutoScrooling();
  }

  @override
  dispose() {
    _newsScrollTimer?.cancel();
    newsScrollController.dispose();
    super.dispose();
  }

  changeSelectedCategory(int index) {
    _selectedCategory.value = index;
  }

  _startNewsAutoScrooling() {
    _newsScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentNewsIndex < 15) {
        _currentNewsIndex.value++;
        newsScrollController.animateTo(
          currentNewsIndex * 50.0,
          duration: const Duration(seconds: 2),
          curve: Curves.linear,
        );
      } else {
        newsScrollController.jumpTo(0);
        _currentNewsIndex.value = 0;
      }
    });
  }
}
