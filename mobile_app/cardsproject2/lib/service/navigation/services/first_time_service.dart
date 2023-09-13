import 'package:get/get.dart';

class FirstTimeService extends GetxService {
  Future<FirstTimeService> init() async => this;

  @override
  void onInit() {
    checkIfFirstTime();
    super.onInit();
  }

  final RxBool _isFirstTime = false.obs;

  bool get isFirstTime => _isFirstTime.value;

  checkIfFirstTime() {
    //TODO: Read Value from storage
    _isFirstTime.value = false;
  }
}
