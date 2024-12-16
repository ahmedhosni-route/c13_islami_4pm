import 'package:flutter/material.dart';
import 'package:islami_4pm_c13/screens/layout/hadith/models/hadeth_model.dart';

import '../../../../core/constant/app_assets.dart';

class HadethCard extends StatelessWidget {
  HadethData hadethData;
  HadethCard({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Image.asset(
                AppAssets.suraDetailsLeft,
                color: theme.primaryColorDark,
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: Text(
                      hadethData.title,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColorDark),
                    ),
                  ),
                ),
              ),
              Image.asset(
                AppAssets.suraDetailsRight,
                color: theme.primaryColorDark,
              ),
            ],
          ),
          Center(
            child: Text(
              hadethData.body,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorDark),
            ),
          ),
        ],
      ),
    );
  }
}
