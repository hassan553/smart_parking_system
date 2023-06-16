import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/core/functions/globle_functions.dart';
import 'package:spark/features/home/views/home_view.dart';

import '../../widgets/snack_bar_widget.dart';
import '../data/repository/login_repo.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepositoryImpl();
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  validEmail(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (!value.contains('@')) {
      return 'not valid email ';
    }
    update();
  }

  validPassword(value) {
    if (value.isEmpty) {
      return 'not valid empty value';
    } else if (value.length < 8) {
      return 'short password length ';
    }
    update();
  }

  Future userLogin(BuildContext context, String email, String password) async {
    isLoading.value = true;
    var result = await loginRepository.login(email, password);
    result.fold((l) {
      isLoading.value = false;
      showSnackBarWidget(
          context: context, message: l, requestStates: RequestStates.error);
    }, (r) {
      isLoading.value = false;
      showSnackBarWidget(
          context: context,
          message: 'Login Successfully',
          requestStates: RequestStates.success);
      navigateOff(const HomeView());
    });
    update();
  }
}
