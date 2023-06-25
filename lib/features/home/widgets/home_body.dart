import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spark/features/home/controller/home_controller.dart';
import 'package:spark/features/widgets/loading.dart';
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
    controller.getAllPlaces();
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
              StreamBuilder<List<PlaceModel>>(
                stream: controller.streamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PlaceModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: LoadingWidget());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available.'));
                  } else {
                    List<PlaceModel> places = snapshot.data!;
                    return placesBody(context, places);
                  }
                },
              ),
              SizedBox(
                height: screenSize(context).height * .02,
              ),
              GetBuilder<HomeController>(
                builder: (context) => Visibility(
                    visible: controller.places.isNotEmpty,
                    child: const BookButton()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget placesBody(BuildContext context, List<PlaceModel> places) {
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
              child: GetBuilder<HomeController>(
                builder: (controller) => GridView.builder(
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
                      crossFadeState: places[index].isBooked
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: BookedPlace(
                        constrainedBox: p11,
                      ),
                      secondChild: UnBookedPlace(
                        title: places[index].title,
                      ),
                    ),
                  ),
                  itemCount: places.length,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
