import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark/core/constants/firebase_constants.dart';
import 'package:spark/core/helper/binding.dart';
import 'package:spark/features/auth/controller/forget_password_controller.dart';
import 'package:spark/features/auth/data/repository/login_repo.dart';
import 'package:spark/features/auth/data/repository/register_repo.dart';
import 'package:spark/features/home/data/repository/home_repo.dart';
import 'package:spark/features/home/views/home_view.dart';
import 'package:spark/features/home/views/map_view.dart';
import 'package:spark/features/home/views/timer_view.dart';
import 'package:spark/features/setting/controller/setting_controller.dart';
import '../core/localization/local.dart';
import '../core/localization/local_controller.dart';
import '../core/resources/app_colors.dart';
import 'package:get/get.dart';

import '../features/auth/presentation/forgetPassword/views/done_message.dart';
import '../features/onboarding/views/splash_one.dart';
import '../features/widgets/snack_bar_widget.dart';

class Rakna extends StatefulWidget {
  const Rakna({super.key});

  @override
  State<Rakna> createState() => _RaknaState();
}

class _RaknaState extends State<Rakna> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: controller.initailLocal,
        translations: MyLocal(),
        initialBinding: Binding(),
        theme: ThemeData(
          fontFamily: GoogleFonts.robotoCondensed().fontFamily,
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.orange,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: AppColors.orange,
            unselectedItemColor: AppColors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: const IconThemeData(
              size: 30,
            ),
            unselectedIconTheme: const IconThemeData(
              size: 25,
            ),
          ),
        ),
        home: const SplashOneView(),
      ),
    );
  }

  Widget checkLogin() {
    if (user == null) {
      return const SplashOneView();
    } else {
      if (isBooked == null) {
        return const HomeView();
      } else {
        return Scaffold(); //const TimerView();
      }
    }
  }
}
