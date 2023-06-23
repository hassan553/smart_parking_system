import 'package:flutter/material.dart';
import 'package:spark/core/functions/globle_functions.dart';
import 'package:spark/core/resources/app_colors.dart';
import 'package:spark/features/widgets/background_widget.dart';
import 'package:spark/features/widgets/custom_text.dart';


class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

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
                  CustomTextWidget(
                    color: Colors.black,
                    text: 'Place and code',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      color: Colors.black,
                      text: 'your place is P-02 \nand your code is 2331',
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextWidget(
                    color: Colors.black,
                    text: 'Description',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      color: Colors.black,
                      text:
                          'P-02 is the second place \nto the right of the entrance',
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextWidget(
                    color: Colors.black,
                    text: 'Information of our car',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.offWhite,
                    ),
                    width: double.infinity,
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
                                text: '12221',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextWidget(
                                text: 'red | Mercedes',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Container(
                  //   color: AppColors.orange,
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   width: double.infinity,
                  //   child: CustomTextWidget(
                  //     text: 'Ok',
                  //     fontSize: 18.sp,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
