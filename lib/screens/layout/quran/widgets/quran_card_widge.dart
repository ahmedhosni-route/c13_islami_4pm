import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_4pm_c13/screens/layout/quran/sura_details.dart';

import '../../../../core/constant/app_assets.dart';
import '../models/sura_data.dart';

class QuranCardWidget extends StatelessWidget {
  SuraData suraData;
  void Function(int value) onTap;
  QuranCardWidget({
    super.key,
    required this.suraData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onTap(suraData.index);
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: suraData);
      },
      child: Row(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppAssets.surahIcon,
              ),
              Text(
                "${suraData.index + 1}",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            width: 26,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraData.nameEn,
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "${suraData.ayaVerses} Verses",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          Text(
            suraData.nameAr,
            style: theme.textTheme.bodyLarge!
                .copyWith(fontFamily: GoogleFonts.amiriQuran().fontFamily),
          ),
        ],
      ),
    );
  }
}
