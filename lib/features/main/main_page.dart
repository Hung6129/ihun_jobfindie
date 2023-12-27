import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                elevation: 0,
                indicatorShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(5),
                  ),
                ),
                height: 45.h,
                selectedIndex: controller.currentIndex.value,
                onDestinationSelected: (int index) {
                  controller.currentIndex.value = index;
                },
                destinations: controller.destinations,
              ),
            ));
      },
    );
  }
}
