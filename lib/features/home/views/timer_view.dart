import 'package:flutter/material.dart';

import 'package:spark/features/widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_colors.dart';
import '../../widgets/custom_text.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
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
                        text: 'Your place is P-02',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RotationTransition(
                      turns: _animation,
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
