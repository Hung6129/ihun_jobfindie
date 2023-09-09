import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_urls.dart';
import 'package:ihun_jobfindie/configuration/global.dart';
import 'package:ihun_jobfindie/features/authenticate/signin/sign_in_page.dart';
import 'package:ihun_jobfindie/features/zoom_drawer/main_page.dart';

import 'package:ihun_jobfindie/shared/models/user_post_model.dart';
import 'package:ihun_jobfindie/shared/models/user_profile_model.dart';

import 'package:ihun_jobfindie/shared/widgets/flutter_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authHelperClassProvider = Provider<AuthenticateHelper>((ref) {
  return AuthenticateHelper();
});

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
        final res = response.data;
        final userData = UserPostModel.fromJson(res);
        await Global.storageServices.setString(
          AppStorage.userProfileKey,
          userData.id,
        );
        await Global.storageServices.setString(
          AppStorage.userTokenKey,
          userData.token,
        );
        if (!context.mounted) return false;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
            (route) => false);
        return true;
      } else {
        toastInfor(text: "Email or Password is wrong");
        return false;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401 &&
          e.response!.data == "Wrong password") {
        toastInfor(text: "Your password is wrong");
      } else if (e.response!.statusCode == 400 &&
          e.response!.data['error'] == "Invalid email address") {
        toastInfor(text: "Email is not valid");
      } else {
        toastInfor(text: "Email is not registered");
      }
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

  Future<void> signOut(BuildContext context) async {
    try {
      await Global.storageServices.remove(AppStorage.userTokenKey);
      await Global.storageServices.remove(AppStorage.userProfileKey);
      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
          (route) => false);
      if (!context.mounted) return;
      ZoomDrawer.of(context)!.close();
    } on DioException catch (e) {
      toastInfor(text: e.toString());
    }
  }

  Future<UserProfileModel> getUserProfile() async {
    try {
      final userId =
          Global.storageServices.getString(AppStorage.userProfileKey);
      final userToken =
          Global.storageServices.getString(AppStorage.userTokenKey);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": "Bearer $userToken"
      };
      final response = await dio.get(
        AppUrls.baseUrl + AppUrls.getUserById + userId,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        final userData = UserProfileModel.fromJson(res);
        return userData;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
