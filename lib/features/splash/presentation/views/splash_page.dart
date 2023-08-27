import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/styles/palettes.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';
import 'package:ihun_jobfindie/core/widgets/app_btn_lbl_icon.dart';

import '../../../../core/widgets/app_icon_btn.dart';
import '../../../authenticate/presentation/signin/sign_in_page.dart';
import '../widgets/list_splash_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController controller = PageController();
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PageView for each splash screen
          PageView(
            onPageChanged: (int index) {
              setState(() {
                currentIndexPage = index;
              });
            },
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),

          /// Show the dots indicator
          /// For each page, the indicator will be updated
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
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
          currentIndexPage == 2
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: AppBtnLabelWithIcon(
                        label: 'Get Started',
                        labelColor: Palettes.textBlack,
                        bgColor: Palettes.p5,
                        iconData: Icons.arrow_forward,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                              (route) => false);
                        },
                        iconColor: Palettes.textBlack),
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
                        if (currentIndexPage == 2) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                              (route) => false);
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

          currentIndexPage == 2
              ? const SizedBox.shrink()
              : Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 50),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        'Skip',
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
