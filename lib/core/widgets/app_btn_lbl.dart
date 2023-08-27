import 'package:flutter/material.dart';

import '../../configuration/styles/text_styles.dart';

class AppBtnLabel extends StatelessWidget {
  const AppBtnLabel({
    super.key,
    required this.label,
    required this.labelColor,
    required this.bgColor,
    required this.shape,
    required this.onPressed,
  });

  final String label;
  final Color labelColor;
  final Color bgColor;

  final OutlinedBorder shape;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: shape,
        elevation: 0,
        maximumSize: const Size(120, 50),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyles.customStyle.bold.setColor(labelColor),
      ),
    );
  }
}
