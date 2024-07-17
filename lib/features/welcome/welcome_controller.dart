import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/welcome/welcome_list_pages.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_icon_btn.dart';

part 'welcome_page.dart';

class WelcomeController extends GetxController {
  final indexPage = 0.obs;
  PageController? pageController;

  List<Widget> listScreens = const [Screen1(), Screen2(), Screen3()];

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
