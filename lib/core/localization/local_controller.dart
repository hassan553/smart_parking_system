
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class LocalController extends GetxController {
  Locale? initailLocal = sharedPreferences.getString('lang') == null
      ? Get.deviceLocale
      : Locale(sharedPreferences.getString('lang')!);
  void changeLanguage(String langCode) {
    sharedPreferences.setString('lang', langCode);
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
  }
}
