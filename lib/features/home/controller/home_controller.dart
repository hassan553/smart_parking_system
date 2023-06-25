import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/data/model/place_model.dart';

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

  final ImageUploading _imageUploading = ImageUploading();
  chooseImageFromCamera(BuildContext context, bool isCamera) async {
    await _imageUploading.getImageAndUpload(context, isCamera);
  }

  List<PlaceModel> places = [];
  StreamController<List<PlaceModel>> streamController =
      StreamController<List<PlaceModel>>.broadcast();

  void getAllPlaces() async {
    places = await homeRepo.getPlacesData();
    streamController.add(places);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
