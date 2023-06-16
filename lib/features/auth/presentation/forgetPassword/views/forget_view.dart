import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../login/widgets/build-rich_text.dart';
import 'otp_view.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black,
            size: 30.sp,
          ),
        ),
      ),
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
                  CustomTextWidget(
                    text: 'homeText9'.tr,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    width: screenSize(context).width,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                    ),
                    child: Text(
                      'homeText10'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      // maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .06,
                  ),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    hintText: 'homeText11'.tr,
                    iconData: Icons.email_outlined,
                  ),
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
                          navigateTo(context, const OTPView());
                        },
                        text: 'homeText12'.tr,
                      ),
                      duration: const Duration(
                        seconds: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .05,
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
