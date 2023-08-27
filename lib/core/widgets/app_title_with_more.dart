import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';

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
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.customStyle.appBarTitle.bold,
          ),
          Text(
            'see more',
            style: TextStyles.customStyle.smallText.underLine,
          ),
        ],
      ),
    );
  }
}
