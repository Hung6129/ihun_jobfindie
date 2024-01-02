import 'package:flutter/material.dart';

import 'package:ihun_jobfindie/shared/theme/palettes.dart';

import '../styles/text_styles.dart';

class AppTextIconBtn extends StatelessWidget {
  const AppTextIconBtn({
    super.key,
    required this.label,
    this.labelColor = Palettes.textBlack,
    required this.bgColor,
    required this.iconData,
    this.shape,
    required this.onPressed,
    required this.iconColor,
    this.fontSize = 14,
    this.iconSize = 20,
  });

  final String label;
  final Color? labelColor;
  final Color bgColor;
  final IconData iconData;
  final Color iconColor;
  final OutlinedBorder? shape;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor,
        size: iconSize ?? 20,
      ),
      label: Text(
        label,
        style: TextStyles.customStyle.bold
            .setColor(labelColor!)
            .setTextSize(fontSize!),
      ),
    );
  }
}
