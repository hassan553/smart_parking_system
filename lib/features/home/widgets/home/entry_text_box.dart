import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_colors.dart';

import '../../../widgets/custom_text.dart';

class EntryBoxTextWidget extends StatelessWidget {
  const EntryBoxTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xffA4A4A4),
          border: Border.all(width: 2, color: AppColors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomTextWidget(
          text: 'homeText2'.tr,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
