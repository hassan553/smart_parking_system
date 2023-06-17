import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/controller/home_controller.dart';
import 'package:spark/features/home/data/model/place_model.dart';
import 'package:spark/features/home/widgets/home/booked_place.dart';
import 'package:spark/features/home/widgets/home/unBooked_place.dart';
import '../../../../core/functions/globle_functions.dart';
import '../../../../core/resources/app_colors.dart';
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
            child: GetBuilder<HomeController>(
              builder: (controller) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  controller.rightPlaces.length,
                  (index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white,
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
                          start: 2, bottom: 2, end: 1),
                      height: constrainedBox.maxHeight * .13,
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        crossFadeState: controller.rightPlaces[index].isBooked
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: BookedPlace(constrainedBox: constrainedBox),
                        secondChild: UnBookedPlace(
                          title: controller.rightPlaces[index].title,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
