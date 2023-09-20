import 'dart:async';

import 'package:cardsproject2/service/local_storage_manager/local_storage_manager_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/http_client/model/general_response.dart';
import '../authentication/authentication_repository.dart';
import '../authentication/model/user.dart';

class HomeController extends GetxController {
  //Declerations
  final RxInt _selectedCategory = 0.obs;
  final Rx<ScrollController> _newsScrollController = ScrollController().obs;
  final RxInt _currentNewsIndex = 0.obs;
  late Timer? _newsScrollTimer;
  final Rx<User> _user = User().obs;

  //Getters
  int get selectedCategory => _selectedCategory.value;
  ScrollController get newsScrollController => _newsScrollController.value;
  int get currentNewsIndex => _currentNewsIndex.value;
  User get user => _user.value;

  //Logic
  @override
  onInit() {
    super.onInit();
    getUserData();
    _startNewsAutoScrooling();
  }

  @override
  dispose() {
    _newsScrollTimer?.cancel();
    newsScrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _newsScrollTimer?.cancel();
    newsScrollController.dispose();
    super.onClose();
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

  getUserData() async {
    GeneralResponse<User, dynamic> response =
        await AuthenticationRepository().getUserApi();
    if (response.success) {
      _user.value = response.data ?? User();
      final LocalStorageManagerApp localStorageManagerApp =
          LocalStorageManagerApp();
      localStorageManagerApp.saveUser(user);
    }
  }
}
