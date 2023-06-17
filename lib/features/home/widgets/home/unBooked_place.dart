import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text.dart';

class UnBookedPlace extends StatelessWidget {
  const UnBookedPlace({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text: title,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
