import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spark/features/widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../widgets/home/book_button.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

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
                        text: 'Your place is P-02',
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
                    child: CustomTextWidget(
                      color: Colors.white,
                      text: '44 M : 22 S',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //  const  BookButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
