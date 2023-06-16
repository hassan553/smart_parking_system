import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../widgets/background_widget.dart';

class DoneMessageView extends StatefulWidget {
  final String message;
  final Widget screen;
  const DoneMessageView({
    super.key,
    required this.message,
    required this.screen,
  });

  @override
  State<DoneMessageView> createState() => _DoneMessageViewState();
}

class _DoneMessageViewState extends State<DoneMessageView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigateOff(
        context,
        widget.screen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/done.json',
                  repeat: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.message.tr,
                  style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
