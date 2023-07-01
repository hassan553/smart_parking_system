import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/controller/home_controller.dart';
import 'package:spark/features/home/views/timer_view.dart';
import 'package:spark/features/widgets/custom_button.dart';
import 'package:spark/features/widgets/loading.dart';
import 'package:spark/main.dart';
import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/background_widget.dart';
import '../data/model/place_model.dart';
import 'home/book_button.dart';
import 'home/booked_place.dart';
import 'home/build_right_side.dart';
import 'home/entry_text_box.dart';

import 'home/unBooked_place.dart';
import 'home/welcome_text_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //controller.getAllPlaces();
  }

  @override
  void dispose() {
    //  controller.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 5, end: 5, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize(context).height * .03,
              ),
              const WelcomeTextWidget(),
              SizedBox(
                height: screenSize(context).height * .02,
              ),
              const EntryBoxTextWidget(),
              SizedBox(
                height: screenSize(context).height * .03,
              ),
              Obx(
                () {
                  if (controller.isLoading.value == true) {
                    return const Center(child: LoadingWidget());
                  } else {
                    return placesBody(context);
                  }
                },
              ),
              //  StreamBuilder<List<PlaceModel>>(
              //       stream: controller.streamController.stream,
              //       builder: (BuildContext context,
              //           AsyncSnapshot<List<PlaceModel>> snapshot) {
              //         if (snapshot.connectionState == ConnectionState.waiting) {
              //           return const Center(child: LoadingWidget());
              //         } else if (snapshot.hasError) {
              //           return Center(child: Text('Error: ${snapshot.error}'));
              //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //           return const Center(child: Text('No data available.'));
              //         } else {
              //           List<PlaceModel> places = snapshot.data!;
              //           return placesBody(context, places);
              //         }
              //       },

              //   ),
              SizedBox(
                height: screenSize(context).height * .02,
              ),
              // Obx(
              //   () => Visibility(
              //     visible: controller.places.isNotEmpty,
              //     child: CustomButton(
              //       function: () {
              //         sharedPreferences.setString('isBooked', 'Booked');
              //         navigateTo(const TimerView());
              //       },
              //       text: 'Book',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget placesBody(BuildContext context) {
    return Expanded(
      flex: 2,
      child: LayoutBuilder(builder: (p0, p11) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff373737),
            borderRadius: BorderRadius.circular(40),
          ),
          width: double.infinity,
          height: screenSize(context).height * .13,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              alignment: Alignment.center,
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => FittedBox(
                    fit: BoxFit.fill,
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstCurve: Curves.easeInOut,
                      secondCurve: Curves.easeInOut,
                      crossFadeState: controller.places[index].isBooked
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: BookedPlace(
                        constrainedBox: p11,
                      ),
                      secondChild: InkWell(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            titleTextStyle: const TextStyle(fontSize: 30),
                            descTextStyle: const TextStyle(fontSize: 20),
                            title: 'Spark',
                            desc:
                                'you will take ${controller.places[index].title}',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              controller.bookPlace(
                                 controller.places[index], controller.places[index].id, true);
                            },
                          ).show();
                        },
                        child: UnBookedPlace(
                          title: controller.places[index].title,
                        ),
                      ),
                    ),
                  ),
                  itemCount: controller.places.length,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
