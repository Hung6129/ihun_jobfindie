import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final indexPage = 0.obs;
  PageController? pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: indexPage.value);
  }

  @override
  void onClose() {
    pageController!.dispose();
    super.onClose();
  }
}
