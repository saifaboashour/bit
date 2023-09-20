import 'dart:developer';

import 'package:cardsproject2/module/authentication/one_time_password/model/otp_reponse.dart';
import 'package:cardsproject2/service/navigation/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../module/authentication/model/user.dart';

class LocalStorageManagerApp {
  final storageReference = GetStorage();

  //Fisrt Time To Use The Application
  saveFirstTimeToUseTheApp(bool isFirstTime) async {
    await storageReference.write("isFirstTime", isFirstTime);
  }

  bool getFirstTimeToUseTheApp() {
    bool? isFirstTime = storageReference.read("isFirstTime");
    return isFirstTime ?? true;
  }

  //Authentication
  saveUserTokens(OtpResponse? tokens) async {
    if (tokens != null) {
      await storageReference.write("tokens", tokens);
      AuthenticationService authenticationService = Get.find();
      authenticationService.checkLoginStatus();
    }
  }

  removeUserTokens() async {
    await storageReference.remove('tokens');
    AuthenticationService authenticationService = Get.find();
    authenticationService.checkLoginStatus();
  }

  OtpResponse? getUserTokens() {
    log('${storageReference.read("tokens")}');
    try {
      OtpResponse? tokens =
          OtpResponse.fromJson(storageReference.read("tokens"));
      return tokens;
    } catch (e) {
      return storageReference.read("tokens");
    }
  }

  //User
  saveUser(User user) async {
    await storageReference.write("user", user);
  }

  removeUser() async {
    await storageReference.remove('user');
  }

  User? getUser() {
    try {
      User? user = User.fromJson(storageReference.read("user"));
      return user;
    } catch (e) {
      return storageReference.read("user");
    }
  }
}
