import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../core/resources/app_assets.dart';
import '../model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

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
    emit(ChangeCurrentIndexState());
  }

  checkCurrentIndex() {
    pageController.animateToPage(
      ++currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(MoveNextPageState());
  }
}
