import 'package:get/get.dart';

import '../../../core/localization/local_controller.dart';

class SettingController extends GetxController {
  bool groupValue = false;
  LocalController controller = Get.find();
  void changeToEnglish(bool value) {
    groupValue = value;
    controller.changeLanguage('en');
    update();
  }

  void changeToArabic(bool value) {
    groupValue = value;
    controller.changeLanguage('ar');
    update();
  }
}
