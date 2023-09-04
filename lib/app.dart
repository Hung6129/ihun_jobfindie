import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_route.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/splash/views/splash_page.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: route,
      ),
    );
  }
}

class IHunJobFindeApp extends StatelessWidget {
  const IHunJobFindeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isFirstTime = Global.storageServices.getIsFirstTime();
    return isFirstTime == true
        ? const SplashPage()
        : Global.storageServices.getIsSignedIn() == true
            ? const MainPage()
            : const SignInPage();
  }
}
