import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/data/model/place_model.dart';

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

  List<Widget> screens = [
    const HomeBody(),
    const NotificationView(),
    SettingView(),
  ];
  UserModel? userModel;

  final ImageUploading _imageUploading = ImageUploading();
  chooseImageFromCamera(BuildContext context, bool isCamera) async {
    await _imageUploading.getImageAndUpload(context, isCamera);
  }

  RxList<PlaceModel> rightPlaces = <PlaceModel>[].obs;

  void getRightPlaces() {
    homeRepo.getRightPlaces().then((result) {
      result.fold(
        (l) {},
        (r) {
          rightPlaces = r!.obs;
        },
      );
    });
  }

  RxList<PlaceModel> leftPlaces = <PlaceModel>[].obs;

  void getLeftPlaces() {
    homeRepo.getLeftPlaces().then((result) {
      result.fold(
        (l) {},
        (r) {
          print('r.obs${r.obs}');
          leftPlaces = r!.obs;
        },
      );
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('IN');
    Future(
      () async {
        //  getLeftPlaces();
        // getRightPlaces();
        HomeRepo().getRightPlaces();
      },
    );
  }
}
