import 'package:get_storage/get_storage.dart';

class LocalStorageManagerApp {
  final storageReference = GetStorage();

  //Fisrt Time To Use The Application
  saveFirstTimeToUseTheApp(bool isFirstTime) async {
    await storageReference.write("isFirstTime", isFirstTime);
  }

  bool getFirstTimeToUseTheApp() {
    bool? isFirstTime = storageReference.read("isFirstTime");
    return isFirstTime ?? false;
  }
}
