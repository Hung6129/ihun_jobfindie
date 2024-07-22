import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';

class AppTitleViewAll extends StatelessWidget {
  const AppTitleViewAll({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Row(
        children: [
          Text(title, style: TextStyles.defaultStyle.appBarTitle),
          Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              'view all',
              style: TextStyles.defaultStyle.smallText.underLine,
            ),
          ),
        ],
      ),
    );
  }
}
