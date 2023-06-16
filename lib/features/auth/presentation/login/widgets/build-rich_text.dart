import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 50.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        children: const [
          TextSpan(
            text: 'S',
            style: TextStyle(color: Color(0xff000000)),
          ),
          TextSpan(
            text: 'p',
            style: TextStyle(color: Color(0xff0E2130)),
          ),
          TextSpan(
            text: 'a',
            style: TextStyle(color: Color(0xff1B4767)),
          ),
          TextSpan(
            text: 'r',
            style: TextStyle(color: Color(0xff3170A1)),
          ),
          TextSpan(
            text: 'k',
            style: TextStyle(color: Color(0xff000000)),
          ),
          TextSpan(
            text: '  ',
          ),
          TextSpan(
            text: '!',
            style: TextStyle(
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
