import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/core/functions/globle_functions.dart';
import 'package:spark/features/home/data/model/place_model.dart';
import 'package:spark/features/home/views/timer_view.dart';
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

  RxList<PlaceModel> places = <PlaceModel>[].obs;
//  StreamController<List<PlaceModel>> streamController =
  //    StreamController<List<PlaceModel>>();
  RxBool isLoading = false.obs;
  void getAllPlaces() async {
    isLoading.value = true;
    places.value = await homeRepo.getPlacesData();
    // streamController.add(places);
    isLoading.value = false;
  }

  bool bookedLoading = false;
  void bookPlace(PlaceModel placeModel, int placeId, bool newValue) async {
    await homeRepo.updatePlaceData(placeId, newValue).then((value) {
      navigateTo(TimerView(placeModel: placeModel));
    });
    update();
  }

  @override
  void dispose() {
    //  streamController.close();
    super.dispose();
  }
}
