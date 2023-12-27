import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';

toastInfor({
  required String text,
  Color bgColor = Palettes.p6,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: bgColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      fontSize: 16.sp,
    );

toastError({
  required String text,
  Color bgColor = Colors.red,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: bgColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      fontSize: 16.sp,
    );

toastSuccess({
  required String text,
  Color bgColor = Colors.green,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: bgColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      fontSize: 16.sp,
    );
