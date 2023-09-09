import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/splash/providers/splash_provider.dart';
import 'package:ihun_jobfindie/features/welcome/views/welcome_page.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final fristOpen = ref.watch(isFirstTimeOpenProvider);
        final isSignedIn = ref.watch(isSignedInProvider);
        return fristOpen == true
            ?
            // context.pushReplacementNamed('welcome')
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomePage(),
                ),
                (route) => false)
            : isSignedIn == true
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                    (route) => false)
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                    (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
