import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/splash/presentation/widgets/list_splash_page.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_icon_btn.dart';

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
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            ),
                            (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Palettes.textWhite,
                      ),
                      label: Text(
                        'Let\'s go!',
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
