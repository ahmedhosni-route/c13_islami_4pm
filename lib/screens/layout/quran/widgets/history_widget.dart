import 'package:flutter/material.dart';
import 'package:islami_4pm_c13/screens/layout/quran/models/sura_data.dart';
import 'package:islami_4pm_c13/screens/layout/quran/sura_details.dart';

import '../../../../core/constant/app_assets.dart';

class HistoryWidget extends StatelessWidget {
  SuraData suraData;
  HistoryWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: suraData);
      },
      child: Container(
        margin: EdgeInsets.all(size.height * 0.01),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraData.nameEn,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.primaryColorDark),
                  ),
                  Text(
                    suraData.nameAr,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.primaryColorDark),
                  ),
                  Text(
                    "${suraData.ayaVerses} verses",
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColorDark),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 1.w(context),
            ),
            Image.asset(
              AppAssets.historyImage,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}

extension Size on num {
  double h(BuildContext context) {
    double number = this / 100;
    return MediaQuery.of(context).size.height * number;
  }

  double w(BuildContext context) {
    double number = this / 100;
    return MediaQuery.of(context).size.width * number;
  }
}
