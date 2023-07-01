import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/auth/data/model/user_model.dart';
import 'package:spark/features/setting/data/repository/setting_repo.dart';

import '../../../core/localization/local_controller.dart';

class SettingController extends GetxController {
  bool groupValue = true;
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

  UserModel? userModel;
  CarModel? listOfCars ;

  SettingRepo? _settingRepo;
  getUserData() async {
    userModel = await SettingRepo().getUserDataFromFirebase();
    print(userModel);
    update();
  }

 void  getUserCarsData() async {
    listOfCars = await SettingRepo().getUserCarDataFromFirebase();
    print('////////////');
    print(listOfCars);
    print('//////////////');
    update();
  }

  bool imageIsLoading = false;
  final ImageUploading _imageUploading = ImageUploading();
  chooseImageFromCamera(BuildContext context, bool isCamera) async {
    imageIsLoading = true;
    await _imageUploading.getImageAndUpload(context, isCamera).then((value) {
      getUserData();
    });
    imageIsLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    getUserCarsData();
  }
}
