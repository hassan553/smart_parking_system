import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size screenSize(context) {
  return MediaQuery.of(context).size;
}

navigateOff(screen) {
  Get.off(screen);
}

navigateTo( screen) {
   Get.to(screen);
}

pop() {
   Get.back();
}
