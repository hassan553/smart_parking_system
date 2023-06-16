import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/functions/globle_functions.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: 'homeText1'.tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: screenSize(context).width * .65,
              child: const Divider(
                thickness: 5,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/images/tap.png',
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
