part of 'welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              /// PageView for each splash screen
              PageView(
                onPageChanged: (int index) => controller.indexPage.value = index,
                controller: controller.pageController,
                children: controller.listScreens,
              ),

              /// Show the dots indicator
              /// For each page, the indicator will be updated
              Obx(
                () => Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: DotsIndicator(
                      dotsCount: controller.listScreens.length,
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
                                  Global.storageServices.setBool(AppStorage.firstTimeOpen, false);
                                  Get.offNamedUntil(AppRoutes.signIn, (route) => false);
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
              Obx(
                () => controller.indexPage.value == 2
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 50.h),
                          child: TextButton(
                            onPressed: () {
                              Global.storageServices.setBool(AppStorage.firstTimeOpen, false);
                              Get.offNamedUntil(AppRoutes.signIn, (route) => false);
                            },
                            child: Text(
                              AppStrings.skipBtn,
                              style: TextStyles.defaultStyle.largeText.whiteText,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
