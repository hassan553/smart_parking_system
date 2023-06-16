import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboard;
  final dynamic iconData;
  final dynamic valid;
  final bool obscure;
  final dynamic focusNode;
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.iconData,
    this.focusNode,
    this.keyboard,
    this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: valid,
      focusNode: focusNode,
      controller: controller,
      cursorColor: AppColors.yellow,
      style: const TextStyle(color: Colors.black),
      obscureText: obscure,
      keyboardType: keyboard,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: AppColors.offWhite,
        prefixIcon: Icon(
          iconData,
          color: Colors.black38,
          size: 25,
        ),
        hintStyle: const TextStyle(color: Colors.black38),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.offWhite, width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.yellow, width: 3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red, width: 3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red, width: 3),
        ),
      ),
    );
  }
}
