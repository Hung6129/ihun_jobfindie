import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';

import 'package:lottie/lottie.dart';

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
                Text(splashTitle1,
                    style: TextStyles.customStyle.mediumText.whiteText),
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
                    splashTitle2a,
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
                  splashTitle2b,
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
      // backgroundColor: Palettes.p6,
      body: Stack(
        children: [
          Image.asset(
            AppAsset.splash3b,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: Lottie.asset(AppAsset.splash3a),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 250.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                splashTitle3a,
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
