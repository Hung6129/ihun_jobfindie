import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/bindings/app_binding.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';

/// Sets a callback to use for reporting errors to Crashlytics.
/// This allows you to capture errors from your entire app in one place.
/// The default behavior is to send uncaught Flutter errors to Crashlytics.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  // initialize the global variable about shared preferences for storing data
  await Global.instance.init();

  // Set the orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        builder: AppFullScreenLoadingIndicator.init(
          builder: ((context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                child: child!,
              )),
        ),
        // theme: ThemeData(useMaterial3: true),
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.init,
        onGenerateRoute: AppRoutes.generateRoute,
        initialBinding: AppBinding(),
      ),
    );
  }
}
