import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/onboarding_model.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/custom_text.dart';

class PageViewWidget extends StatelessWidget {
  final PageController pageController;
  final List<OnBoardingModel> onboardingList;
  final dynamic onPageChange;
  const PageViewWidget({
    super.key,
    required this.onPageChange,
    required this.onboardingList,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingList.length,
        onPageChanged: onPageChange,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                onboardingList[index].image,
                fit: BoxFit.fill,
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: screenSize(context).height * .07,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: screenSize(context).width * .8,
                height: screenSize(context).height * .2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.yellow,
                    width: 2,
                  ),
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: onboardingList[index].title,
                      fontSize: 25,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextWidget(
                        text: onboardingList[index].subTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
