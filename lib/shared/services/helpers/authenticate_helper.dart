import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_urls.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';
// import 'package:ihun_jobfindie/shared/models/user_model.dart';
import 'package:ihun_jobfindie/shared/widgets/flutter_toast.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticateHelper {
  Dio dio = Dio();

  Future<bool> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        toastInfor(text: "Email or Password is empty");
        return false;
      }
      var mapData = {
        "email": email,
        "password": password,
      };
      var response = await dio.post(
        AppUrls.baseUrl + AppUrls.logIn,
        data: mapData,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        toastInfor(text: "Login Success");
        // final res = response.data;
        // final userData = UserModel.fromJson(res);

        if (!context.mounted) return false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
          (route) => false,
        );
        return true;
      } else {
        toastInfor(text: "Email or Password is wrong");
        return false;
      }
    } on DioException catch (e) {
      toastInfor(text: e.toString());
      return false;
    }
  }

  Future<bool> signUp(
    BuildContext context,
    String userName,
    String email,
    String password,
  ) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        toastInfor(text: "Email or Password is empty");
        return false;
      } else if (userName.isEmpty) {
        toastInfor(text: "Username is empty");
        return false;
      }
      var mapData = {
        "username": userName,
        "email": email,
        "password": password,
      };
      var response = await dio.post(
        AppUrls.baseUrl + AppUrls.register,
        data: mapData,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      if (response.statusCode == 201) {
        toastInfor(text: "Register Success");
        if (!context.mounted) return false;
        Navigator.pop(context);
        signIn(context, email, password);
        return true;
      } else {
        toastInfor(text: "Email or Password is wrong");
        return false;
      }
    } on DioException catch (e) {
      toastInfor(text: e.toString());
      return false;
    }
  }
}
