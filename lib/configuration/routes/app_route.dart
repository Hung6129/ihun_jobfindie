import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ihun_jobfindie/app.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/authenticate/signup/sign_up_page.dart';
import 'package:ihun_jobfindie/features/splash/views/splash_page.dart';

import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

final GoRouter route = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const IHunJobFindeApp();
        },
        routes: [
          GoRoute(
            path: 'splash',
            builder: (BuildContext context, GoRouterState state) {
              return const SplashPage();
            },
          ),
          GoRoute(
            name: 'signin',
            path: 'signin',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: 'main',
            name: 'main',
            builder: (BuildContext context, GoRouterState state) {
              return const MainPage();
            },
          ),
        ]),
  ],
);
