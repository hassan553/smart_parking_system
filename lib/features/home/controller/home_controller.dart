import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../auth/data/model/user_model.dart';
import '../../notification_view.dart/views/notification_view.dart';
import '../../setting/views/setting_view.dart';
import '../data/repository/home_repo.dart';
import '../widgets/home_body.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  int bottomNavigationCurrentIndex = 0;
  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    update();
  }

  List<Widget> screens =  [
    HomeBody(),
    NotificationView(),
    SettingView(),
  ];
  UserModel? userModel;
  Future getUserData() async {
    String? token = sharedPreferences.getString('token');
    var result = await homeRepo.getUserProfile(token!);
    result.fold((l) {
         update();
    }, (r) {
      userModel = r;
      update();
    });
  }

  chooseImageFromCamera() async {
    String? token = sharedPreferences.getString('token');
    try {
      await homeRepo.chooseImage().then((value) {
        homeRepo.uploadImage(token!);
        print('Success uplaod');
           update();
      });
    } catch (error) {
      print('Success ${error.toString()}');
         update();
    }
  }
}
