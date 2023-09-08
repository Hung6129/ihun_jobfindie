import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/app.dart';
import 'package:ihun_jobfindie/configuration/global.dart';


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
  await Global.init();

  // Set the orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
  );
}
