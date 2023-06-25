import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text.dart';

class UnBookedPlace extends StatelessWidget {
  const UnBookedPlace({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(30),
      child: CustomTextWidget(
        text: title,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
