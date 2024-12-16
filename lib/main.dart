import 'package:flutter/material.dart';
import 'package:islami_4pm_c13/core/theme/app_colors.dart';
import 'package:islami_4pm_c13/screens/layout/layout_screen.dart';
import 'package:islami_4pm_c13/screens/layout/quran/sura_details.dart';
import 'package:islami_4pm_c13/screens/splash/splash_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
