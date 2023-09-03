import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/app.dart';
import 'package:ihun_jobfindie/configuration/global.dart';

import 'configuration/constants/app_strings.dart';

void main() async {
  await Global.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => const MaterialApp(
          title: appTitle,
          debugShowCheckedModeBanner: false,
          home: IHunJobFindeApp()),
    );
  }
}
