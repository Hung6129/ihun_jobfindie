import 'package:flutter/material.dart';

import '../../configuration/styles/text_styles.dart';

/// An icon with text badge
/// We can customize the icon, text, and icon color as we want

class AppTextBadge extends StatelessWidget {
  const AppTextBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  final String label;
  final IconData icon;
  final Color iconColor;
  final bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.customStyle.blackText.bold),
          Icon(icon, color: iconColor),
        ],
      ),
    );
  }
}
