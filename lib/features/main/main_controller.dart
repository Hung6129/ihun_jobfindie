import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/chat/presentation/views/chat_page.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/views/job_page.dart';
import 'package:ihun_jobfindie/features/main/home/home_page.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  var listScreens = [
    HomePage(),
    JobPage(),
    ChatPage(),
  ];

  List<Widget> destinations = const [
    NavigationDestination(
      selectedIcon: Icon(FontAwesome.home),
      icon: Icon(FontAwesome.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Badge(
        child: Icon(FontAwesome.comment),
      ),
      label: 'Messages',
    ),
    NavigationDestination(
      icon: Icon(FontAwesome.briefcase),
      label: 'Jobs',
    ),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
