import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/onboarding/controller/onBoarding_controller.dart';
import '../../widgets/background_widget.dart';
import '../../auth/presentation/login/views/login_view.dart';
import '../widgets/dots_widget.dart';
import '../../widgets/custom_button.dart';
import '../../../core/functions/globle_functions.dart';
import '../widgets/page_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: GetBuilder<OnBoardingController>(
              init: OnBoardingController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  PageViewWidget(
                    onboardingList: controller.onBoardingStrings,
                    onPageChange: (value) {
                      controller.changeCurrentIndex(value);
                    },
                    pageController: controller.pageController,
                  ),
                  DotIndicator(
                    index: controller.currentIndex.toDouble(),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomButton(
                      function: () {
                        if (controller.currentIndex == 2) {
                          navigateOff(context, const LoginView());
                        } else {
                          controller.checkCurrentIndex();
                        }
                      },
                      text: controller.currentIndex == 2
                          ? 'get_started'.tr
                          : 'next'.tr,
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
