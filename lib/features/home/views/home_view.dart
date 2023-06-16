import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

import '../widgets/custom_bottom_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: GetBuilder(
        init: HomeController(),
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
