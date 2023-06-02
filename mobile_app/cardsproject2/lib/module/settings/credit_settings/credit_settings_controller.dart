import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditSettingsController extends GetxController {
  //Declerations
  //Request Credit Bank Transfer
  final Rx<TextEditingController> _amountTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _notesTextFieldController =
      TextEditingController().obs;

  final RxString _amountErrorMessage = ''.obs;
  final RxString _notesErrorMessage = ''.obs;
  //Prepaid
  final Rx<TextEditingController> _cardNumberTextFieldController =
      TextEditingController().obs;

  final RxString _cardNumberErrorMessage = ''.obs;

  //Getters
  //Request Credit Bank Transfer
  TextEditingController get amountTextFieldController =>
      _amountTextFieldController.value;
  TextEditingController get notesTextFieldController =>
      _notesTextFieldController.value;

  String get amountErrorMessage => _amountErrorMessage.value;
  String get notesErrorMessage => _notesErrorMessage.value;
  //Prepaid
  TextEditingController get cardNumberTextFieldController =>
      _cardNumberTextFieldController.value;

  String get cardNumberErrorMessage => _cardNumberErrorMessage.value;

  //Logic
}
