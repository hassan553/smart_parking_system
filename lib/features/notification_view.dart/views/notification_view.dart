import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_text.dart';

import '../../widgets/background_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWidget(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: CustomTextWidget(
                    text: 'homeText6'.tr,
                    fontSize: 30.sp,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...List.generate(
                  21,
                  (index) => Container(
                    width: screenSize(context).width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(width: 2, color: Colors.yellow),
                    ),
                    child: Text(
                      'homeText7'.tr,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
