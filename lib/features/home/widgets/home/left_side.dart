import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/controller/home_controller.dart';
import 'package:spark/features/home/widgets/home/booked_place.dart';
import 'package:spark/features/home/widgets/home/unBooked_place.dart';
import '../../../../core/functions/globle_functions.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(60),
          bottomEnd: Radius.circular(60),
        ),
      ),
      height: screenSize(context).height * .64,
      width: screenSize(context).width * .4,
      child: LayoutBuilder(
        builder: (context, constrainedBox) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(top: 30, bottom: 30),
            child: Obx(
             () => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  controller.leftPlaces.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: index == 0
                              ? const Radius.circular(10)
                              : const Radius.circular(0),
                          bottomRight: index == 5
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
                        crossFadeState: controller.leftPlaces[index].isBooked
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: BookedPlace(constrainedBox: constrainedBox),
                        secondChild: UnBookedPlace(
                          title: controller.leftPlaces[index].title,
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
