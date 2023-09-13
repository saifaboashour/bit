import 'package:cardsproject2/module/authentication/one_time_password/model/otp_reponse.dart';
import 'package:cardsproject2/service/navigation/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  saveUserTokens(OtpResponse tokens) async {
    await storageReference.write("tokens", tokens);
    AuthenticationService authenticationService = Get.find();
    authenticationService.checkLoginStatus();
  }

  removeUserTokens() async {
    await storageReference.remove('tokens');
    AuthenticationService authenticationService = Get.find();
    authenticationService.checkLoginStatus();
  }

  OtpResponse? getUserTokens() {
    OtpResponse? tokens = storageReference.read("tokens");
    return tokens;
  }
}
