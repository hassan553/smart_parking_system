import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../core/functions/globle_functions.dart';
import '../../core/resources/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Callback function;
  final String text;
  const CustomButton({
    super.key,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      minWidth: screenSize(context).width,
      onPressed: function,
      child: CustomTextWidget(
        text: text,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
