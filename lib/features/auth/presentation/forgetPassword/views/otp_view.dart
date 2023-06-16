import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'reset_password_view.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../login/widgets/build-rich_text.dart';
import '../../login/widgets/pin_code.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BuildRichText(),
                  CustomTextWidget(
                    text: 'homeText8'.tr,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  FittedBox(
                    child: CustomTextWidget(
                      text: 'homeText13'.tr,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    width: screenSize(context).width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                    ),
                    child: Text(
                      'homeText14'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      // maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .06,
                  ),
                  const PinCodeWidget(),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  SizedBox(
                    width: screenSize(context).width,
                    child: AnimatedCrossFade(
                      crossFadeState: CrossFadeState.showFirst,
                      secondChild: const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.orange),
                      ),
                      firstChild: CustomButton(
                        function: () {
                          navigateTo(context, const ResetPasswordView());
                        },
                        text: 'homeText15'.tr,
                      ),
                      duration: const Duration(
                        seconds: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .02,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "homeText16".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomTextWidget(
                          text: "homeText17".tr,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
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
