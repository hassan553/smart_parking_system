import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/auth/controller/register_controller.dart';
import '../../../../home/views/home_view.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';

import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../forgetPassword/views/done_message.dart';

class CarInfoView extends StatelessWidget {
  const CarInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                height: screenSize(context).height * .1,
              ),
              CustomTextWidget(
                text: 'homeText28'.tr,
                fontSize: 18.sp,
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: AppColors.black,
                thickness: 4,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextWidget(
                text: 'homeText29'.tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: screenSize(context).height * .07,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomTextWidget(
                  text: 'homeText30'.tr,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFieldWidget(
                hintText: 'homeText31'.tr,
                controller: TextEditingController(),
              ),
              SizedBox(
                height: screenSize(context).height * .05,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomTextWidget(
                  text: 'homeText32'.tr,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFieldWidget(
                hintText: 'homeText33'.tr,
                controller: TextEditingController(),
              ),
              SizedBox(
                height: screenSize(context).height * .05,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomTextWidget(
                  text: 'homeText34'.tr,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFieldWidget(
                hintText: 'homeText35'.tr,
                controller: TextEditingController(),
              ),
              SizedBox(
                height: screenSize(context).height * .05,
              ),
              GetBuilder<RegisterController>(
                builder: (controller) => CustomButton(
                  function: () {
                    controller.createCarInfo(
                        context: context,
                        model: controller.carModel.text,
                        number: controller.carNumber.text,
                        color: controller.carColor.text);
                  },
                  text: 'homeText37'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
