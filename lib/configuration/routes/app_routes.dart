import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/views/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/views/signup/sign_up_page.dart';
import 'package:ihun_jobfindie/features/candidate/presentation/views/profile_page.dart';
import 'package:ihun_jobfindie/features/main/main_page.dart';
import 'package:ihun_jobfindie/features/walk_through/walk_through_page.dart';

import 'package:ihun_jobfindie/features/welcome/welcome_page.dart';

class AppRoutes {
  static const String init = '/';
  static const String wellcome = '/welcome';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String jobDetail = '/job-detail';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case init:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WalkThroughPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case wellcome:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WelcomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case signIn:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case signUp:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignUpPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case home:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case jobDetail:
      case profile:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
    }
  }
}
