import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_route.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/welcome/views/welcome_page.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(useMaterial3: true),
        title: appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: route,
      ),
    );
  }
}

class IHunJobFindeApp extends ConsumerWidget {
  const IHunJobFindeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fristOpen = ref.watch(isFirstTimeOpenProvider);
    final isSignedIn = ref.watch(isSignedInProvider);
    return fristOpen == true
        ? const WelcomePage()
        : isSignedIn == true
            ? const MainPage()
            : const SignInPage();
  }
}
