import 'dart:ui';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageController extends GetxController {
  // Observable variable for language
  var currentLocale = Locale('en', 'US').obs;

  void changeLanguage(Locale locale) {
    currentLocale.value = locale;
    EasyLocalization.of(Get.context!)?.setLocale(locale);

    // Force GetX to rebuild the entire app by updating the locale
    Get.updateLocale(locale);
  }
}
