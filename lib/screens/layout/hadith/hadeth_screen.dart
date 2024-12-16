import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_4pm_c13/core/constant/app_assets.dart';
import 'package:islami_4pm_c13/screens/layout/hadith/models/hadeth_model.dart';
import 'package:islami_4pm_c13/screens/layout/hadith/widgets/hadeth_card.dart';
import 'package:islami_4pm_c13/screens/layout/quran/quran_screen.dart';
import 'package:islami_4pm_c13/screens/layout/quran/widgets/history_widget.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> ahadeth = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (ahadeth.isEmpty) {
          readHadeth();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.hadethBg), fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.homeLogo),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return HadethCard(hadethData: ahadeth[itemIndex]);
                },
                options: CarouselOptions(
                    height: 60.h(context),
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    pageSnapping: true,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    animateToClosest: true,
                    viewportFraction: 0.7),
              ),
            )
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: ahadeth.length,
            //     itemBuilder: (context, index) {
            //       return HadethCard(hadethData: ahadeth[index]);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  readHadeth() async {
    for (int i = 1; i <= 50; i++) {
      String fullHadeth = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      List<String> hadeth = fullHadeth.split("\n");
      ahadeth.add(HadethData(title: hadeth[0].trim(), body: hadeth[1].trim()));
    }
    setState(() {});
  }
}
