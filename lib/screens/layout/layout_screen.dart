import 'package:flutter/material.dart';
import 'package:islami_4pm_c13/core/constant/app_assets.dart';
import 'package:islami_4pm_c13/core/theme/app_colors.dart';
import 'package:islami_4pm_c13/screens/layout/adhan/adhan_screen.dart';
import 'package:islami_4pm_c13/screens/layout/hadith/hadeth_screen.dart';
import 'package:islami_4pm_c13/screens/layout/quran/quran_screen.dart';
import 'package:islami_4pm_c13/screens/layout/radio/radio_screen.dart';
import 'package:islami_4pm_c13/screens/layout/sebha/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    AdhanScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          backgroundColor: AppColors.coffeeColor,
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: AppColors.white),
          selectedLabelStyle: const TextStyle(color: AppColors.white),
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: selectedIndex != 0
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(14)),
                    child: const ImageIcon(AssetImage(AppAssets.quranIcon))),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: selectedIndex != 1
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(14)),
                    child: const ImageIcon(AssetImage(AppAssets.hadethIcon))),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: selectedIndex != 2
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(14)),
                    child: const ImageIcon(AssetImage(AppAssets.sebhaIcon))),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: selectedIndex != 3
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(14)),
                    child: const ImageIcon(AssetImage(AppAssets.radioIcon))),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: selectedIndex != 4
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(14)),
                    child: const ImageIcon(AssetImage(AppAssets.adhanIcon))),
                label: "Adhan"),
          ]),
      body: screens[selectedIndex],
    );
  }
}
