import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/globle_functions.dart';
import '../../../widgets/custom_text.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(60),
          bottomStart: Radius.circular(60),
        ),
      ),
      height: screenSize(context).height * .64,
      width: screenSize(context).width * .4,
      child: LayoutBuilder(
        builder: (context, constrainedBox) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(top: 30, bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                6,
                (index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      bottomLeft: index == 5
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                    ),
                  ),
                  width: constrainedBox.maxWidth,
                  margin: const EdgeInsetsDirectional.only(
                      end: 5, bottom: 2, start: 1),
                  height: constrainedBox.maxHeight * .13,
                  child: CustomTextWidget(
                    text: 'P-0${index + 1}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
