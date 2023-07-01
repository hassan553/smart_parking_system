import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../../core/functions/globle_functions.dart';
import '../../../widgets/custom_button.dart';
import '../../views/compelet_park_info.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomButton(
        function:(){} ,
        text: 'homeText3'.tr,
      ),
    );
  }
}
