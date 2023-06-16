import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class BuildSocialWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final dynamic onTap;
  const BuildSocialWidget({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: const Color(0xff0E2130),
              size: 20.sp,
            ),
            SizedBox(
              width: 10.sp,
            ),
            CustomTextWidget(
              text: text,
              fontSize: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}
