import 'package:flutter/material.dart';

import '../../configuration/styles/text_styles.dart';

class AppBtnLabelWithIcon extends StatelessWidget {
  const AppBtnLabelWithIcon({
    super.key,
    required this.label,
    required this.labelColor,
    required this.bgColor,
    required this.iconData,
    required this.shape,
    required this.onPressed,
    required this.iconColor,
  });

  final String label;
  final Color labelColor;
  final Color bgColor;
  final IconData iconData;
  final Color iconColor;
  final OutlinedBorder shape;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: shape,
        elevation: 0,
        maximumSize: const Size(120, 50),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
      label: Text(
        label,
        style: TextStyles.customStyle.bold.setColor(labelColor),
      ),
    );
  }
}
