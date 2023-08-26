import 'package:flutter/material.dart';

class Palettes {
  /// Text color
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textGrey = Color(0xFF9E9E9E);

  /// Main palette
  static const Color p1 = Color(0xFF6527BE);
  static const Color p2 = Color(0xFF9681EB);
  static const Color p3 = Color(0xFF45CFDD);
  static const Color p4 = Color(0xFFA7EDE7);

  ///
  static const Color p5 = Color(0xFFC0D8C0);
  static const Color p6 = Color(0xFFECB390);
  static const Color p7 = Color(0xFFC84B31);
  static const Color p8 = Color(0xFFF5EEDC);
  static const Color p9 = Color(0xFFC0D8C0);

 /// Random color
  static const List color = [
    Color(0xffB85252),
    Color(0xffB4C6A6),
    Color(0xffF4ABC4),
    Color(0xff346751),
    Color(0xffFFC947),
    Color(0xff3282B8),
    Palettes.p1,
    Palettes.p2,
    Palettes.p3,
    Palettes.p4,
    Palettes.p7,
    Palettes.p9,
    Palettes.textWhite,
  ];
  static getRandomColor() => (Palettes.color.toList()..shuffle()).first;

}
