import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/snack_bar_widget.dart';
import '../data/repository/register_repo.dart';
import '../presentation/car_info/views/car_info.dart';



class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final RegisterRepository _registerRepository = RegisterRepositoryImpl();

  Future userRegister({
    required BuildContext context,
    required String email,
    required String password,

    required String name
  }) async {
    var result = await _registerRepository.register(
        email: email, password: password, name: name
    );
    result.fold((l) {

      showSnackBarWidget(context: context, message: l, requestStates: RequestStates.error);
    }, (r) {
      showSnackBarWidget(context: context, message: 'Create Account Successfully', requestStates: RequestStates.success);
      navigateOff(context, const CarInfoView());
    });
  }
}