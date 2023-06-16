import 'package:flutter/material.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 3,
            color: Colors.black,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.offWhite,
          child:  CustomTextWidget(
            text: "OR",
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 3,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}