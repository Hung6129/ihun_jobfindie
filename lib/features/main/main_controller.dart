import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/chat/presentation/views/chat_page.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/views/job_page.dart';
import 'package:ihun_jobfindie/features/main/home/home_page.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  var listScreens = [
    HomePage(),
    ChatPage(),
    JobPage(),
  ];

  List<Widget> destinations = [
    NavigationDestination(
      selectedIcon: Icon(
        FontAwesomeIcons.house,
      ),
      icon: Icon(
        FontAwesomeIcons.house,
        size: 18.sp,
      ),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Badge(
        child: Icon(
          FontAwesomeIcons.solidComments,
        ),
      ),
      icon: Badge(
        child: Icon(
          FontAwesomeIcons.solidComments,
          size: 18.sp,
        ),
      ),
      label: 'Messages',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        FontAwesomeIcons.briefcase,
      ),
      icon: Icon(
        FontAwesomeIcons.briefcase,
        size: 18.sp,
      ),
      label: 'Jobs',
    ),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
