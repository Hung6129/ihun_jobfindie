import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/global.dart';
import 'package:ihun_jobfindie/features/welcome/provider/welcome_provider.dart';
import 'package:ihun_jobfindie/features/welcome/widgets/list_splash_page.dart';

import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_icon_btn.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> listScreens = const [
      Screen1(),
      Screen2(),
      Screen3(),
    ];
    final PageController controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          /// PageView for each splash screen
          PageView(
            onPageChanged: (int index) {
              ref.read(indexPageProvider.notifier).state = index;
            },
            controller: controller,
            children: listScreens,
          ),

          /// Show the dots indicator
          /// For each page, the indicator will be updated
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: DotsIndicator(
                dotsCount: listScreens.length,
                position: ref.watch(indexPageProvider),
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(10),
                  color: Palettes.textWhite.withOpacity(0.5),
                  activeColor: Palettes.textWhite,
                  activeSize: const Size(35.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),

          /// Skip button, when user next to the last page, skip button will be hidden
          /// and the get started button will be shown
          /// This will be tracked by [currentIndexPage]
          /// Get started button will navigate to sign in page
          ref.watch(indexPageProvider) == 2
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 200.h),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palettes.p2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                      ),
                      onPressed: () {
                        Global.storageServices
                            .setBool(AppAsset.firstTimeOpen, false);
                        context.pushReplacementNamed('signin');
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Palettes.textWhite,
                      ),
                      label: Text(
                        splashTitle3b,
                        style: TextStyles.customStyle2.bold.whiteText,
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50, right: 10),
                    child: AppIconButton(
                      bgColor: Palettes.p4,
                      icon: Icons.arrow_forward,
                      iconColor: Palettes.textBlack,
                      onPressed: () {
                        if (ref.watch(indexPageProvider) == 2) {
                          Global.storageServices
                              .setBool(AppAsset.firstTimeOpen, false);
                          context.pushReplacementNamed('signin');
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut,
                          );
                        }
                      },
                    ),
                  ),
                ),

          ref.watch(indexPageProvider) == 2
              ? const SizedBox.shrink()
              : Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 50),
                    child: TextButton(
                      onPressed: () {
                        Global.storageServices
                            .setBool(AppAsset.firstTimeOpen, false);
                        context.pushReplacementNamed('signin');
                      },
                      child: Text(
                        skipBtn,
                        style: TextStyles.defaultStyle.largeText.whiteText,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
