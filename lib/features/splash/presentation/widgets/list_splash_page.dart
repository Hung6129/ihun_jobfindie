import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/core/app_asset.dart';
import 'package:lottie/lottie.dart';

import '../../../../configuration/styles/palettes.dart';
import '../../../../configuration/styles/text_styles.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAsset.splash1,
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
            child: Lottie.asset(AppAsset.splash2),
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
            child: Lottie.asset(AppAsset.splash3),
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
