import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.coffeeColor,
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.white,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: AppColors.coffeeColor, fontSize: 26),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.coffeeColor,
        ),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.white),
          bodySmall: TextStyle(fontSize: 16, color: AppColors.white),
          bodyMedium: TextStyle(fontSize: 20, color: AppColors.white)));
}
