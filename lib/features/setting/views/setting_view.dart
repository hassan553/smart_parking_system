import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../controller/setting_controller.dart';
import 'profile_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/background_widget.dart';

class SettingView extends StatelessWidget {
  final SettingController settingController = Get.find();
  SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            CustomTextWidget(
              text: 'homeText42'.tr,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                navigateTo(context, const ProfileView());
              },
              child: Container(
                padding: const EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.offWhite,
                ),
                width: screenSize(context).width,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/preson.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Hassan Marzouk',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        CustomTextWidget(
                          text: 'homeText41'.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<SettingController>(
              builder: (controller) => Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: true,
                      groupValue: settingController.groupValue,
                      onChanged: (value) {
                        settingController.changeToEnglish(value!);
                      },
                      title: CustomTextWidget(
                        text: 'homeText40'.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: false,
                      groupValue: settingController.groupValue,
                      onChanged: (value) {
                        settingController.changeToArabic(value!);
                      },
                      title: CustomTextWidget(
                        text: 'homeText39'.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(
              function: () {},
              text: 'homeText38'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
