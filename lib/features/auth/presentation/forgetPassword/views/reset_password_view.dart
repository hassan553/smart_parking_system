import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/views/home_view.dart';
import 'package:spark/features/widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';

import '../../login/widgets/build-rich_text.dart';

import 'done_message.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    text: 'homeText18'.tr,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    hintText: 'homeText11'.tr,
                    iconData: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: screenSize(context).height * .02,
                  ),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    hintText:  'homeText11'.tr,
                    iconData: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: screenSize(context).height * .04,
                  ),
                  AnimatedCrossFade(
                    crossFadeState: CrossFadeState.showFirst,
                    secondChild: const Center(
                      child: CircularProgressIndicator(color: AppColors.orange),
                    ),
                    firstChild: CustomButton(
                      function: () {
                        navigateTo(
                          context,
                           DoneMessageView(
                            message:
                                'homeText20'.tr,
                            screen:const  HomeView(),
                          ),
                        );
                      },
                      text: 'homeText19'.tr,
                    ),
                    duration: const Duration(
                      seconds: 1,
                    ),
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
