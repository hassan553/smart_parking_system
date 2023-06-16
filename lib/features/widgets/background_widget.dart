import 'package:flutter/material.dart';
import '../../core/functions/globle_functions.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AppAssets.splash,
            ),
          ),
        ),
      ),
      Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.grey,
              AppColors.grey,
            ],
          ),
        ),
      ),
      child
    ]);
  }
}
