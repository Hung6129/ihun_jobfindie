import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';

class AppTitleWithMore extends StatelessWidget {
  const AppTitleWithMore({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.customStyle.appBarTitle.bold,
          ),
          Text(
            homeViewAll,
            style: TextStyles.customStyle.smallText.underLine,
          ),
        ],
      ),
    );
  }
}
