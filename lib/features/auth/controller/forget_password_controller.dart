import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/core/functions/globle_functions.dart';
import 'package:spark/features/auth/presentation/login/views/login_view.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../widgets/snack_bar_widget.dart';

class ForgetPasswordController extends GetxController {
  var isLoading = false.obs;
  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email);
      navigateOff(const LoginView());
      showSnackBarWidget(
          context: context,
          message: 'Check Your Email ',
          requestStates: RequestStates.success);
      isLoading.value = false;
    } catch (error) {
      showSnackBarWidget(
          context: context,
          message: 'Oops An error.Retry please',
          requestStates: RequestStates.success);
      isLoading.value = false;
    }
  }
}
