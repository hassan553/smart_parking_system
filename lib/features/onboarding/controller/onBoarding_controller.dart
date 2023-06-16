import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/app_assets.dart';
import '../model/onboarding_model.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int currentIndex = 0;
  List<OnBoardingModel> onBoardingStrings = [
    OnBoardingModel(
      image: AppAssets.logo,
      title: 'Best Parking Spots'.tr,
      subTitle: 'Find the best parking spots near you'.tr,
    ),
    OnBoardingModel(
      image: AppAssets.tap,
      title: 'Quick Navigation'.tr,
      subTitle: 'Navigate quickly in crowded garage'.tr,
    ),
    OnBoardingModel(
      image: AppAssets.payment,
      title: 'Easy Payments'.tr,
      subTitle: 'Hassle free payment to save your time'.tr,
    ),
  ];
  changeCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  checkCurrentIndex() {
    pageController.animateToPage(
      ++currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    update();
  }
}
