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
import 'package:ihun_jobfindie/shared/widgets/app_snackbar.dart';
import 'package:logger/logger.dart';

class AuthenticateController extends GetxController {
  late final AuthenUseCase _authUseCase;
  AuthenticateController(this._authUseCase);

  final RxBool isSavePassword = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  final logger = Logger(printer: PrettyPrinter(methodCount: 0));

  void saveToken(UserPostModel user) async {
    await Global.storageServices.setString(AppStorage.userTokenKey, user.token);
    await Global.storageServices.setString(AppStorage.userProfileKey, user.id);
    await Global.storageServices.setString(AppStorage.refreshToken, user.refreshToken);
    await Global.storageServices.setString(AppStorage.userEmail, user.email);
    await Global.storageServices.setString(AppStorage.userName, user.userName);
  }

  Future<void> executeLoginByAccount(String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: 'Vui lòng nhập đầy đủ thông tin',
          isError: true,
        ).show(context);
        return;
      }
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.signIn(email, password);
      if (response is AppResultSuccess<UserPostModel>) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: AppStrings.signInSuccess,
          isError: false,
        ).show(context);
        if (isSavePassword.value) {
          Global.storageServices.setBool(
            AppStorage.isSavePassword,
            true,
          );
        }
        saveToken(response.netData!);
        Get.offAllNamed(AppRoutes.home);
      }
      if (response is AppResultFailure) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: (response as AppResultFailure).exception!.message.toString(),
          isError: true,
        ).show(context);
      }
    } catch (e) {
      AppSnackbarWidget(
        title: 'Thông báo',
        message: AppStrings.signInFailed,
        isError: true,
      ).show(context);
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  Future<void> requestRegister(
    String userName,
    String password,
    String email,
    BuildContext context,
  ) async {
    try {
      if (userName.isEmpty || password.isEmpty || email.isEmpty) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: 'Vui lòng nhập đầy đủ thông tin',
          isError: true,
        ).show(context);
        return;
      }
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.signUp(email, password, userName);
      AppFullScreenLoadingIndicator.dismiss();
      if (response is AppResultSuccess<EmptyModel>) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: AppStrings.signUpSuccess,
          isError: false,
        ).show(context);
        Get.offAllNamed(AppRoutes.signIn);
      }
      if (response is AppResultFailure) {
        AppSnackbarWidget(
          title: 'Thông báo',
          message: (response as AppResultFailure).exception!.message.toString(),
          isError: true,
        ).show(context);
      }
    } catch (e) {
      AppSnackbarWidget(
        title: 'Thông báo',
        message: AppStrings.signUpFailed,
        isError: true,
      ).show(context);
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }
}
