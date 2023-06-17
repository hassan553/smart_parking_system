import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text.dart';

class BookedPlace extends StatelessWidget {
  const BookedPlace({super.key,required this.constrainedBox});
  final BoxConstraints constrainedBox;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constrainedBox.maxWidth * .7,
          height: constrainedBox.maxHeight * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/car2.PNG'),
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: CustomTextWidget(
            text: 'homeText5'.tr,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
