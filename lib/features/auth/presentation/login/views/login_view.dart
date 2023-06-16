import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../../controller/login_controller.dart';
import '../../forgetPassword/views/forget_view.dart';
import '../../register/views/register_view.dart';
import '../widgets/build-rich_text.dart';
import '../widgets/build-socail_widget.dart';
import '../widgets/divider_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: BackgroundWidget(
            child: Align(
              alignment: AlignmentDirectional.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 30, start: 30),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        const BuildRichText(),
                        CustomTextWidget(
                          text: 'Park your car'.tr,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          height: screenSize(context).height * .1,
                        ),
                        CustomTextFieldWidget(
                          controller: controller.emailController,
                          hintText: 'Email address'.tr,
                          iconData: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'not valid empty value'.tr;
                            } else if (!value.contains('@')) {
                              return 'not valid email'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        CustomTextFieldWidget(
                          controller: controller.passwordController,
                          hintText: 'Password'.tr,
                          iconData: Icons.lock,
                          obscure: true,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'not valid empty value'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, const ForgetPasswordView());
                          },
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomTextWidget(
                              text: 'Forget Password ?'.tr,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize(context).height * .05,
                        ),
                        GetBuilder<LoginController>(
                          builder: (controller) => CustomButton(
                            function: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.userLogin(
                                    context,
                                    controller.emailController.text.trim(),
                                    controller.passwordController.text.trim());
                              }
                            },
                            text: 'Sign In'.tr,
                          ),
                        ),
                        // AnimatedCrossFade(
                        //   secondChild: const LoadingWidget(),
                        //   crossFadeState: state is LoginLoadingState
                        //       ? CrossFadeState.showSecond
                        //       : CrossFadeState.showFirst,
                        //   firstChild: SizedBox(
                        //     width: screenSize(context).width,
                        //     child: CustomButton(
                        //       function: () {
                        //         if (formKey.currentState!.validate()) {
                        //           cubit.userLogin(
                        //               cubit.emailController.text.trim(),
                        //               cubit.passwordController.text.trim());
                        //         }
                        //       },
                        //       text: 'Sign In'.tr,
                        //     ),
                        //   ),
                        //   duration: const Duration(milliseconds: 500),
                        // ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        Row(
                          children: [
                            CustomTextWidget(
                              text: "Don\'t have an account ?".tr,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const RegisterView());
                              },
                              child: CustomTextWidget(
                                text: "Sign Up".tr,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize(context).height * .07,
                        ),
                        const DividerWidget(),
                        SizedBox(
                          height: screenSize(context).height * .05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: BuildSocialWidget(
                                iconData: FontAwesome.facebook,
                                onTap: () {},
                                text: 'Facebook'.tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Expanded(
                              flex: 1,
                              child: BuildSocialWidget(
                                iconData: FontAwesome.google,
                                onTap: () {},
                                text: 'Google'.tr,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
//showSnackBarWidget(
              context: context,
              message: 'Successfully Login',
              requestStates: RequestStates.success);
          sharedPreferences
              .setString('token', state.userModel.data!.token!)
              .then((value) {
            print(value);
            navigateOff(context, const HomeView());
          });
        } else if (state is LoginErrorState) {
          showSnackBarWidget(
              context: context,
              message: 'Error In Login',
              requestStates: RequestStates.error);
        }
//
 */
