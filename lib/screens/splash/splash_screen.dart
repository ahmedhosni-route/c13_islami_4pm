import 'package:flutter/material.dart';
import 'package:islami_4pm_c13/core/constant/app_assets.dart';
import 'package:islami_4pm_c13/screens/layout/layout_screen.dart';

import '../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AppAssets.logo),
            const Spacer(),
            Image.asset(AppAssets.routeLogo),
          ],
        ),
      ),
    );
  }
}
