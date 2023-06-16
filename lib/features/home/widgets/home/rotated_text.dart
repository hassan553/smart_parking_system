import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';

class RotatedText extends StatelessWidget {
  const RotatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: SizedBox(
        width: 350,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 2,
            ),
            CustomTextWidget(
              text: '4',
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              text: 'homeText5'.tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/images/svg/back_arrow_left_icon.svg',
            ),
          ],
        ),
      ),
    );
  }
}
