import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';

class WalkThroughController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    final isFirstTimeOpen = Global.storageServices.getIsFirstTime();
    final isSignedIn = Global.storageServices.getIsSignedIn();
    await Future.delayed(const Duration(seconds: 2));
    if (isFirstTimeOpen == true) {
      // Get.offNamedUntil('/welcome', (route) => false);
      Navigator.pushNamedAndRemoveUntil(Get.context!, AppRoutes.wellcome, (route) => false);
    } else if (isSignedIn == true) {
      // Get.offNamedUntil('/home', (route) => false);
      Navigator.pushNamedAndRemoveUntil(Get.context!, AppRoutes.home, (route) => false);
    } else {
      // Get.offNamedUntil('/sign-in', (route) => false);
      Navigator.pushNamedAndRemoveUntil(Get.context!, AppRoutes.signIn, (route) => false);
    }
  }
}
