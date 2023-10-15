import 'package:cardsproject2/translation/arabic.dart';
import 'package:cardsproject2/translation/english.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/local_storage_manager/local_storage_manager_app.dart';

class Localizations extends Translations {
  final LocalStorageManagerApp _storageManager = LocalStorageManagerApp();

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'ar_JO': arabic,
      };

  static const Locale locale =  Locale('en', 'US');
  static const fallbackLocale =  Locale('en', 'US');

  static final languages = [
    'English',
    'Arabic',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'JO'),
  ];

  static Locale? getLocaleFromLanguage(String language) {
    for (int i = 0; i < languages.length; i++) {
      if (language == languages[i]) return locales[i];
    }
    return Get.locale;
  }

  void changeLocale(String language) {
    final locale = getLocaleFromLanguage(language);
    Get.updateLocale(locale!);
    _storageManager.saveAppLanguage(language);
  }

}