import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihun_jobfindie/app.dart';
import 'package:ihun_jobfindie/configuration/global.dart';

void main() async {
  await Global.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}
