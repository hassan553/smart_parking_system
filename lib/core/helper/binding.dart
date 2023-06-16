
import 'package:get/get.dart';
import 'package:spark/features/home/controller/home_controller.dart';
import 'package:spark/features/setting/controller/setting_controller.dart';

import '../../features/auth/controller/login_controller.dart';
import '../../features/auth/controller/register_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
