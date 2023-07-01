
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark/features/auth/presentation/forgetPassword/views/done_message.dart';
import 'package:spark/features/home/views/home_view.dart';
import '../../../core/functions/globle_functions.dart';
import '../../../main.dart';
import '../../home/views/map_view.dart';
import '../../widgets/snack_bar_widget.dart';
import '../data/repository/register_repo.dart';
import '../presentation/car_info/views/car_info.dart';

class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var carModel = TextEditingController();
  var carNumber = TextEditingController();
  var carColor = TextEditingController();
  final RegisterRepository _registerRepository = RegisterRepositoryImpl();
  var isLoading = false.obs;
  Future userRegister(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    isLoading.value = true;
    var result = await _registerRepository.register(
        email: email, password: password, name: name);
    result.fold((l) {
      isLoading.value = false;
      showSnackBarWidget(
          context: context, message: l, requestStates: RequestStates.error);
    }, (r)async {
      isLoading.value = false;
      showSnackBarWidget(
          context: context,
          message: 'Create Account Successfully',
          requestStates: RequestStates.success);
                   await  sharedPreferences.setString('userId',r);

      navigateOff(
        const CarInfoView(),
      );
    });
  }

  Future createCarInfo(
      {required BuildContext context,
      required String model,
      required String number,
      required String color}) async {
    var result = await _registerRepository.createCarInfo(
        model: model, color: color, number: number);
    result.fold((l) {
      showSnackBarWidget(
          context: context, message: l, requestStates: RequestStates.error);
    }, (r) {
      showSnackBarWidget(
          context: context, message: r, requestStates: RequestStates.success);
      navigateOff(const HomeView());
    });
  }

  var isEmailVerified = false.obs;
  isUserEmailVerified() {
    isEmailVerified.value = _registerRepository.checkIsEmailVerified();
    if (isEmailVerified.value) navigateOff(const CarInfoView());
  }

  resentEmailVerification() {
    _registerRepository.sendVerificationEmail();
  }
}
