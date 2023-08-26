import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/styles/palettes.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';
import 'package:ihun_jobfindie/core/widgets/app_btn_label.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/signin/sign_in_page.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/app_icon_btn.dart';

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
          currentIndexPage == 2
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: AppBtnLabel(
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

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/splash-1.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 280.w,
            height: 70.h,
            margin: EdgeInsets.only(bottom: 200.h),
            decoration: BoxDecoration(
              color: Palettes.textBlack.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to',
                    style: TextStyles.customStyle.mediumText.whiteText),
                Text('iHun Jobfinde',
                    style: TextStyles.defaultStyle.appBarTitle.whiteText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palettes.p5,
      body: Stack(
        children: [
          Positioned(
            bottom: 200.h,
            right: 0,
            left: 0,
            child: Lottie.asset(
              'assets/splash-2.json',
            ),
          ),
          Positioned(
              left: 0,
              top: 100.h,
              child: Container(
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  color: Palettes.textWhite,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                height: 80.h,
                width: 250.w,
                child: Center(
                  child: Text(
                    'We help you find your dream job',
                    style: TextStyles.defaultStyle.appBarTitle.blackText,
                  ),
                ),
              )),
          Positioned(
            right: 0,
            top: 500.h,
            child: Container(
              padding: EdgeInsets.only(left: 20.w),
              decoration: BoxDecoration(
                color: Palettes.textWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
              ),
              height: 80.h,
              width: 250.w,
              child: Center(
                child: Text(
                  'With more than 1000+ jobs available',
                  style: TextStyles.defaultStyle.appBarTitle.blackText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palettes.p6,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: Lottie.asset(
              'assets/splash-3.json',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 200.h, left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Let\'s get started now!',
                textAlign: TextAlign.center,
                style: TextStyles.defaultStyle.appBarTitle.blackText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
