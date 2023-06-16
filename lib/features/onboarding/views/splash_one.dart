import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'splash_two.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_assets.dart';

class SplashOneView extends StatefulWidget {
  const SplashOneView({super.key});

  @override
  State<SplashOneView> createState() => _SplashOneViewState();
}

class _SplashOneViewState extends State<SplashOneView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      navigateOff( const SplashTwoView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splash,
      fit: BoxFit.fill,
      width: screenSize(context).width,
      height: screenSize(context).height,
    );
  }
}
