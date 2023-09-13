import 'package:cardsproject2/translation/arabic.dart';
import 'package:cardsproject2/translation/english.dart';
import 'package:get/get.dart';

class Localizations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'ar_JO': arabic,
      };
}
