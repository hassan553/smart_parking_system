import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/controller/timer_controller.dart';
import 'package:spark/features/home/data/model/place_model.dart';
import 'dart:async';
import 'package:spark/features/widgets/background_widget.dart';
import 'package:spark/features/widgets/custom_button.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../widgets/home/book_button.dart';

class TimerView extends StatefulWidget {
  final PlaceModel placeModel;
  const TimerView({super.key, required this.placeModel});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  TimerController controller = Get.find();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextWidget(
                    color: Colors.black,
                    text: 'Reservation information',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const Divider(
                    thickness: 3,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: CustomTextWidget(
                        color: Colors.black,
                        text: widget.placeModel.title,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 80,
                      child: Center(
                        child: Image.asset(
                          'assets/images/car.PNG',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GetBuilder<TimerController>(
                      builder: (controller) => CustomTextWidget(
                        color: Colors.white,
                        text: '${controller.hours} M : ${controller.minutes} S',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  CustomButton(
                    function: () {
                      controller.cancelsTimer();
                    },
                    text: 'Finish',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
