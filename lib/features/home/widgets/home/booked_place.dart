import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:get/get.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text.dart';

class BookedPlace extends StatelessWidget {
  const BookedPlace({super.key, required this.constrainedBox});
  final BoxConstraints constrainedBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RotatedBox(
        quarterTurns: -3,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: constrainedBox.maxWidth * .5,
              height: constrainedBox.maxHeight * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
                image: const DecorationImage(
                    image: AssetImage('assets/images/car2.PNG'),
                    fit: BoxFit.contain),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: CustomTextWidget(
                text: 'homeText5'.tr,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
