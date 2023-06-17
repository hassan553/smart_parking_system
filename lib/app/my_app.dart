import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark/core/helper/binding.dart';
import 'package:spark/features/auth/controller/forget_password_controller.dart';
import 'package:spark/features/auth/data/repository/login_repo.dart';
import 'package:spark/features/auth/data/repository/register_repo.dart';
import 'package:spark/features/home/data/repository/home_repo.dart';
import 'package:spark/features/setting/controller/setting_controller.dart';
import '../core/localization/local.dart';
import '../core/localization/local_controller.dart';
import '../core/resources/app_colors.dart';
import 'package:get/get.dart';

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
    print('DONE');
    Future(
      () async {
        await HomeRepo().getRightPlaces();
        await HomeRepo().getLeftPlaces();
      },
    );
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
}

class sd extends StatelessWidget {
  const sd({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          height: 200,
          width: 120,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class T extends StatefulWidget {
  T({super.key});

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  bool groupValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SettingController>(
          builder: (controller) => Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: true,
                  groupValue: controller.groupValue,
                  onChanged: (value) {
                    controller.changeToEnglish(value!);
                  },
                  title: const Text('english'),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: false,
                  groupValue: controller.groupValue,
                  onChanged: (value) {
                    controller.changeToArabic(value!);
                  },
                  title: Text('click'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
