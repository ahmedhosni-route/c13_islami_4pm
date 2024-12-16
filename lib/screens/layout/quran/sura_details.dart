import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_4pm_c13/core/constant/app_assets.dart';
import 'package:islami_4pm_c13/core/theme/app_colors.dart';
import 'package:islami_4pm_c13/main.dart';
import 'package:islami_4pm_c13/screens/layout/quran/quran_screen.dart';
import 'package:islami_4pm_c13/screens/layout/quran/widgets/quran_card_widge.dart';

import 'models/sura_data.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "suraDetails";
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  bool isLight = false;
  String suraDetails = "";
  List<String> aya = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (suraDetails.isEmpty) {
      readFile(arg.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg.nameEn,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.suraDetailsImage),
          Column(
            textDirection: TextDirection.rtl,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                children: [
                  Image.asset(AppAssets.suraDetailsLeft),
                  Expanded(
                    child: Center(
                      child: Text(
                        arg.nameAr,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.primaryColor),
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.suraDetailsRight),
                ],
              ),
              suraDetails.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text.rich(
                            TextSpan(
                              children: aya.map(
                                (e) {
                                  index++;
                                  return TextSpan(
                                    text: e.trim(),
                                    children: [
                                      TextSpan(
                                        text: " $index ",
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                fontFamily: "quran",
                                                fontSize: 30),
                                      )
                                    ],
                                    // children: [
                                    //   WidgetSpan(
                                    //     child: Directionality(
                                    //       textDirection: TextDirection.rtl,
                                    //       child: Container(
                                    //         padding: const EdgeInsets.all(8),
                                    //         margin: const EdgeInsets.symmetric(
                                    //             horizontal: 8),
                                    //         decoration: BoxDecoration(
                                    //             color: theme.primaryColor,
                                    //             shape: BoxShape.circle),
                                    //         child: Text(
                                    //           (index).toString(),
                                    //           textDirection: TextDirection.rtl,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   )
                                    // ],
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontFamily:
                                          GoogleFonts.amiriQuran(fontSize: 20)
                                              .fontFamily,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }

  void readFile(int index) async {
    suraDetails = await rootBundle.loadString("assets/suras/${index + 1}.txt");
    aya = suraDetails.trim().split("\n");

    setState(() {});
  }
}
