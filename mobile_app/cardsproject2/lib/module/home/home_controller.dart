import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cardsproject2/module/home/home_repository.dart';
import 'package:cardsproject2/module/home/model/category.dart';
import 'package:cardsproject2/module/home/model/product.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/http_client/model/general_response.dart';
import '../../service/local_storage_manager/user_service.dart';
import '../../util/common_widgets.dart';
import 'model/news.dart';
import 'model/product_input_answer.dart';
import 'products_details/product_input_field_builder.dart';

class HomeController extends GetxController {
  //Declarations
  InputFieldBuilder inputFieldBuilder = InputFieldBuilder();
  final RxInt _selectedType = 0.obs;
  final Rx<ScrollController> _newsScrollController = ScrollController().obs;
  final RxInt _currentNewsIndex = 0.obs;
  late Timer? _newsScrollTimer;
  final RxList<News> _newsList = <News>[].obs;
  final RxList<Category> _categoriesList = <Category>[].obs;
  final RxList<Category> _subcategoriesList = <Category>[].obs;
  final RxList<Product> _productsList = <Product>[].obs;
  final Rx<Product> _product = Product().obs;
  final RxInt _productSelectedQuantity = 1.obs;
  final RxList<Widget> _inputFields = <Widget>[].obs;

  final RxBool _isLoading = false.obs;

  //Getters
  int get selectedType => _selectedType.value;
  ScrollController get newsScrollController => _newsScrollController.value;
  int get currentNewsIndex => _currentNewsIndex.value;
  List<News> get newsList => _newsList.toList();
  List<Category> get categoriesList => _categoriesList.toList();
  List<Category> get subcategoriesList => _subcategoriesList.toList();
  List<Product> get productsList => _productsList.toList();
  Product get product => _product.value;
  int get productSelectedQuantity => _productSelectedQuantity.value;
  List<Widget> get inputFields => _inputFields.toList();

  bool get isLoading => _isLoading.value;

  //Logic
  @override
  onInit() {
    super.onInit();
    getNewsData();
    getCategoriesDate();
    _startNewsAutoScrolling();
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

  changeSelectedType(int index) {
    _selectedType.value = index;
    getCategoriesDate();
  }

  _startNewsAutoScrolling() {
    _newsScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentNewsIndex < 15) {
        try {
          _currentNewsIndex.value++;
          newsScrollController.animateTo(
            currentNewsIndex * 50.0,
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
          );
        } catch (e) {
          log('$e');
        }
      } else {
        newsScrollController.jumpTo(0);
        _currentNewsIndex.value = 0;
      }
    });
  }

  getNewsData() async {
    _isLoading.value = true;
    GeneralResponse<News, dynamic> response =
        await HomeRepository().getNewsApi();
    if (response.success) {
      _newsList.addAll(response.listData ?? []);
    }
    _isLoading.value = false;
  }

  getCategoriesDate()async{
    _isLoading.value = true;
    _categoriesList.clear();
    GeneralResponse<Category,dynamic> response = await HomeRepository().getCategoriesApi(selectedType+1);
    if(response.success){
      _categoriesList.addAll(response.listData ?? []);
    }
    _isLoading.value = false;
  }

  getSubCategoriesDate(int categoryId)async{
    _subcategoriesList.clear();
    GeneralResponse<Category,dynamic> response = await HomeRepository().getSubCategoriesApi(categoryId);
    if(response.success){
      _subcategoriesList.addAll(response.listData ?? []);
    }
  }

  getProductsDate(int subcategoryId)async{
    _productsList.clear();
    GeneralResponse<Product,dynamic> response = await HomeRepository().getProductsApi(subcategoryId);
    if(response.success){
      _productsList.addAll(response.listData ?? []);
    }
  }

  getProductDetailsDate(int productId)async{
    GeneralResponse<Product,dynamic> response = await HomeRepository().getProductDetailsApi(productId);
    if(response.success){
        _product.value = response.data ?? Product();
        getInputFieldsViews();
    }
  }

  changeProductSelectedQuantity(int quantity){
    _productSelectedQuantity.value = quantity;
  }

  getInputFieldsViews() {

    _inputFields.value = [];
    inputFieldBuilder.resetMaps();
    product.inputFields?.forEach((inputField) {
      _inputFields.add(inputFieldBuilder.buildInputField(
          inputField));
      _inputFields.add(CommonWidgets().buildVerticalSpace(),);
    });

  }

  purchase(bool isPrinted)async{
    List<ProductInputAnswer> fields = inputFieldBuilder.getAnswers();

    String deviceName = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      deviceName = '${info.brand} ${info.model}';
    }else if(Platform.isIOS){
      IosDeviceInfo info = await deviceInfo.iosInfo;
      deviceName = info.name;
    }

    Map<String, String> requestBody = {
      'quantity': '$productSelectedQuantity',
      'device_name': deviceName,
      'product_id': '${product.id}',
      'is_printed': '$isPrinted',
      'fields': jsonEncode(fields),
      };

    GeneralResponse<dynamic, dynamic> response =
        await HomeRepository().purchase(requestBody);

    if (!response.success) {
      // showErrorMessages(response.error);
    } else {

      if(isPrinted){
        printCards();
      }
      // Get.back();
      // Get.toNamed(Routes.oneTimePassword,
      //     parameters: {'token': response.data?.otpToken ?? ''});
    }
    final userService = Get.find<UserService>();
    userService.getUserData();
  }

  printCards(){}
}
