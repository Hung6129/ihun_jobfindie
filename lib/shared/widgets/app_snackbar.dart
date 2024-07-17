import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';

class AppSnackbarWidget {
  const AppSnackbarWidget(
      {required this.title,
      required this.message,
      this.icon,
      this.duration,
      this.isError = false,
      this.titleWidget,
      this.messageWidget});

  final String title;
  final String message;
  final bool isError;
  final Icon? icon;
  final Duration? duration;
  final Widget? titleWidget;
  final Widget? messageWidget;

  void show(BuildContext? context) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(title, message,
        titleText: titleWidget ?? Text(title, style: TextStyles.defaultStyle.whiteText.mediumText.bold),
        messageText: messageWidget ?? Text(message, style: TextStyles.defaultStyle.whiteText),
        duration: duration ?? const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: isError ? Colors.red : Colors.green,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isError
              ? Icon(
                  Icons.error,
                  color: Palettes.p8,
                  size: 32,
                )
              : Icon(
                  Icons.check_circle,
                  color: Palettes.p8,
                  size: 32,
                ),
        ),
        snackPosition: SnackPosition.BOTTOM);
  }
}
