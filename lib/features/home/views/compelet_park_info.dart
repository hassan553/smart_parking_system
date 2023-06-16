import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class CompleteParkingInfo extends StatelessWidget {
  const CompleteParkingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
                text: 'Reservation information',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: screenSize(context).width * .8,
                child: const Divider(
                  thickness: 5,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: screenSize(context).height * .05,
              ),
              Align(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget(
                      text: 'Your place is ',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(
                      text: 'P-02 ',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize(context).height * .03,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                    text: 'You will book ',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextWidget(
                    text: 'By ',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: screenSize(context).height * .01,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: false,
                      groupValue: false,
                      onChanged: (value) {},
                      activeColor: Color(0xff6872FF),
                      title: CustomTextWidget(
                        text: 'Day',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: false,
                      groupValue: false,
                      onChanged: (value) {},
                      activeColor: Color(0xff6872FF),
                      title: CustomTextWidget(
                        text: 'Hour',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: screenSize(context).width,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(218, 230, 230, 235),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 28.sp,
                      color: const Color(0xff707070),
                    ),
                    CustomTextWidget(
                      text: '  1/2/2023',
                      color: const Color(0xff707070),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: CustomTextWidget(
                  text: 'To',
                  color: const Color(0xff000000),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: screenSize(context).width,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(218, 230, 230, 235),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 28.sp,
                      color: const Color(0xff707070),
                    ),
                    CustomTextWidget(
                      text: '  1/2/2023',
                      color: const Color(0xff707070),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize(context).height * .2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Total Payment',
                        color: const Color(0xff000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomTextWidget(
                        text: '1 Day',
                        color: const Color(0xff000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomTextWidget(
                    text: '20\$',
                    color: const Color(0xff000000),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              CustomButton(
                function: () {
                  navigateTo(const CompleteParkingInfo());
                },
                text: 'Payment',
              ),
              SizedBox(
                height: 20.sp,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
