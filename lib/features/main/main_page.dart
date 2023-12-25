import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/features/main/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
            body: Obx(
              () => controller.listScreens[controller.currentIndex.value],
            ),
            bottomNavigationBar: Obx(
              () => NavigationBar(
                selectedIndex: controller.currentIndex.value,
                onDestinationSelected: (int index) {
                  controller.currentIndex.value = index;
                },
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Badge(child: Icon(Icons.notifications_sharp)),
                    label: 'Notifications',
                  ),
                ],
              ),
            ));
      },
    );
  }
}
