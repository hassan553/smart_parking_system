import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white30,
      ),
      child: PinCodeFields(
        length: 4,
        fieldBorderStyle: FieldBorderStyle.square,
        responsive: false,
        fieldHeight: 50.0,
        fieldWidth: 50.0,
        borderWidth: 3,
        activeBorderColor: const Color(0xff676767),
        activeBackgroundColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        keyboardType: TextInputType.number,
        autoHideKeyboard: false,
        fieldBackgroundColor: Colors.transparent,
        borderColor: const Color(0xff676767),
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        onComplete: (output) {},
      ),
    );
  }
}