import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.bgColor,
    required this.iconColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: bgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius12,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
