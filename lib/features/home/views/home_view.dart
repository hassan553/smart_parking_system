import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

import '../widgets/custom_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello');
    controller.getAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: GetBuilder<HomeController>(
        builder: (controller) =>
            controller.screens[controller.bottomNavigationCurrentIndex],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => BottomBarWidget(
          function: (index) {
            controller.changeBottomNavigationCurrentIndex(index);
          },
          index: controller.bottomNavigationCurrentIndex,
        ),
      ),
    );
  }
}
