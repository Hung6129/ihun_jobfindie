import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/global.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/splash/views/splash_page.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

class IHunJobFindeApp extends StatefulWidget {
  const IHunJobFindeApp({super.key});

  @override
  State<IHunJobFindeApp> createState() => _IHunJobFindeAppState();
}

class _IHunJobFindeAppState extends State<IHunJobFindeApp> {
  final isFirstTime = Global.storageServices.getIsFirstTime();

  @override
  Widget build(BuildContext context) {
    return isFirstTime == true
        ? const SplashPage()
        : Global.storageServices.getIsSignedIn() == true
            ? const MainPage()
            : const SignInPage();
  }
}
