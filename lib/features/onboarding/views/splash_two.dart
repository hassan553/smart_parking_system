import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/background_widget.dart';
import '../../../core/resources/app_strings.dart';
import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../auth/presentation/login/widgets/build-rich_text.dart';
import 'onboarding_view.dart';

class SplashTwoView extends StatefulWidget {
  const SplashTwoView({super.key});

  @override
  State<SplashTwoView> createState() => _SplashTwoViewState();
}

class _SplashTwoViewState extends State<SplashTwoView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateOff( const OnBoardingView());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.welcome.tr,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Image.asset(
                    AppAssets.hand,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const BuildRichText(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppStrings.splash.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
