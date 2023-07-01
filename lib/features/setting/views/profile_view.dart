import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spark/features/setting/controller/setting_controller.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: 20),
            child: GetBuilder<SettingController>(
              init: SettingController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      GetBuilder<SettingController>(
                        init: SettingController(),
                        builder: (controller) => controller.imageIsLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    NetworkImage(controller.userModel!.image!),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: Card(
                                elevation: 10,
                                child: TextButton(
                                  child: const Text('Choose from Camera '),
                                  onPressed: () {
                                    controller.chooseImageFromCamera(
                                        context, true);
                                    Get.back();
                                  },
                                ),
                              ),
                              content: Card(
                                elevation: 10,
                                child: TextButton(
                                  child: const Text('Choose from gallery '),
                                  onPressed: () {
                                    controller.chooseImageFromCamera(
                                        context, false);
                                    Get.back();
                                  },
                                ),
                              ),
                              actions: [
                                Card(
                                  elevation: 10,
                                  color: Colors.red,
                                  child: MaterialButton(
                                    child: const Text('Close'),
                                    onPressed: () => Get.back(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.offWhite,
                          child: const Icon(
                            Icons.camera_alt,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextWidget(
                    text: controller.userModel!.name ?? 'hassan ',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.offWhite,
                    ),
                    width: screenSize(context).width,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 60,
                          padding: const EdgeInsetsDirectional.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/car.PNG'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: controller.listOfCars?.number??'00000',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextWidget(
                                text:
                                  '${controller.listOfCars?.color} | ${controller.listOfCars?.model}',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  CustomButton(
                    function: () {
                      controller.getUserData();
                    },
                    text: 'Add Car ',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetWidget(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [],
        ),
      ),
    );
  }
}
