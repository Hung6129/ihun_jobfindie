import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';

import '../../shared/theme/text_styles.dart';

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
      padding: allPadding4,
      decoration: const BoxDecoration(
        borderRadius: borderRadius12,
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
