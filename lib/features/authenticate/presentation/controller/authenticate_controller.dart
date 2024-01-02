import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/domain/models/empty_model.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:logger/logger.dart';

class AuthenticateController extends GetxController {
  late final AuthenUseCase _authUseCase;
  AuthenticateController(this._authUseCase);

  final RxBool isSavePassword = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  void saveToken(String tokenKey, String profileId) async {
    final logger = Logger(printer: PrettyPrinter(methodCount: 0));
    logger.i('tokenKey: $tokenKey');
    logger.i('profileId: $profileId');
    await Global.storageServices.setString(AppStorage.userTokenKey, tokenKey);
    await Global.storageServices.setString(AppStorage.userProfileKey, profileId);
  }

  Future<void> executeLoginByAccount(String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          'Thông báo',
          'Vui lòng nhập đầy đủ thông tin',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
        return;
      }
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.signIn(email, password);
      if (response is AppResultSuccess<UserPostModel>) {
        Get.snackbar(
          'Thông báo',
          AppStrings.signInSuccess,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
        if (isSavePassword.value) {
          Global.storageServices.setBool(AppStorage.isSavePassword, true);
        }
        saveToken(response.netData!.token, response.netData!.id);
        Get.offAllNamed(AppRoutes.home);
      }
      if (response is AppResultFailure) {
        // toastError(text: (response as AppResultFailure).exception!.message.toString());
        Get.snackbar(
          'Thông báo',
          (response as AppResultFailure).exception!.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Thông báo',
        AppStrings.signInFailed,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        duration: Duration(seconds: 3),
      );
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  void requestRegister(String userName, String password, String email) async {
    try {
      if (userName.isEmpty || password.isEmpty || email.isEmpty) {
        Get.snackbar(
          'Thông báo',
          'Vui lòng nhập đầy đủ thông tin',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
        return;
      }
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.signUp(email, password, userName);
      AppFullScreenLoadingIndicator.dismiss();
      if (response is AppResultSuccess<EmptyModel>) {
        Get.snackbar(
          'Thông báo',
          AppStrings.signUpSuccess,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed(AppRoutes.signIn);
      }
      if (response is AppResultFailure) {
        Get.snackbar(
          'Thông báo',
          (response as AppResultFailure).exception!.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Thông báo',
        AppStrings.signUpFailed,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        duration: Duration(seconds: 3),
      );
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }
}
