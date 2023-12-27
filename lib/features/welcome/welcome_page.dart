import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';

import 'package:ihun_jobfindie/features/welcome/welcome_controller.dart';
import 'package:ihun_jobfindie/features/welcome/welcome_list_pages.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_icon_btn.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listScreens = const [
      Screen1(),
      Screen2(),
      Screen3(),
    ];
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              /// PageView for each splash screen
              PageView(
                onPageChanged: (int index) {
                  controller.indexPage.value = index;
                },
                controller: controller.pageController,
                children: listScreens,
              ),

              /// Show the dots indicator
              /// For each page, the indicator will be updated
              Obx(
                () => Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: DotsIndicator(
                      dotsCount: listScreens.length,
                      position: controller.indexPage.value,
                      decorator: DotsDecorator(
                        spacing: const EdgeInsets.all(10),
                        color: Palettes.textWhite.withOpacity(0.5),
                        activeColor: Palettes.textWhite,
                        activeSize: const Size(35.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Skip button, when user next to the last page, skip button will be hidden
              /// and the get started button will be shown
              /// This will be tracked by [currentIndexPage]
              /// Get started button will navigate to sign in page
              Obx(
                () => controller.indexPage.value == 2
                    ? SizedBox.shrink()
                    : Hero(
                        tag: 'next3',
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50.h, right: 10.w),
                            child: AppIconButton(
                              iconSize: 30,
                              bgColor: Palettes.p4,
                              icon: Icons.arrow_forward,
                              iconColor: Palettes.textBlack,
                              onPressed: () {
                                if (controller.indexPage.value == 2) {
                                  Global.storageServices
                                      .setBool(AppStorage.firstTimeOpen, false);
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoutes.signIn, (route) => false);
                                } else {
                                  controller.pageController!.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linearToEaseOut,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
              ),
              Obx(() => controller.indexPage.value == 2
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, bottom: 50.h),
                        child: TextButton(
                          onPressed: () {
                            Global.storageServices
                                .setBool(AppStorage.firstTimeOpen, false);
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.signIn, (route) => false);
                          },
                          child: Text(
                            AppStrings.skipBtn,
                            style: TextStyles.defaultStyle.largeText.whiteText,
                          ),
                        ),
                      ),
                    ))
            ],
          ),
        );
      },
    );
  }
}
