import 'package:flutter/material.dart';

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

  List<Widget> destinations = const [
    NavigationDestination(
      selectedIcon: Icon(FontAwesomeIcons.house),
      icon: Icon(FontAwesomeIcons.house),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Badge(
        child: Icon(FontAwesomeIcons.solidComments),
      ),
      label: 'Messages',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.briefcase),
      label: 'Jobs',
    ),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
