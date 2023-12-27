import 'package:flutter/material.dart' show Colors, EdgeInsets;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ihun_jobfindie/configuration/data/services/storage_helper.dart';
import 'package:logger/logger.dart';

/// Make a global class to store all the global variables
class Global {
  Global._();
  static final Global instance = Global._();

  static late StorageServices storageServices;

  static late Logger logger;

  Future init() async {
    storageServices = await StorageServices().init();

    /// Logger config
    logger = Logger(printer: PrettyPrinter(methodCount: 0));

    /// EasyLoading config
    await configLoading();
  }

  Future configLoading() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 500)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..contentPadding = const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0)
      ..indicatorSize = 70.0
      ..radius = 16.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..userInteractions = true
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.scale;
  }
}
