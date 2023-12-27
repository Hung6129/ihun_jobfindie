import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/local/app_shared_pref.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';

import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/flutter_toast.dart';

class AuthenticateController extends GetxController {
  late final AuthenUseCase _authUseCase;
  AuthenticateController(this._authUseCase);

  final RxBool isSavePassword = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  void saveToken(String tokenKey, String profileId) async {
    await Global.storageServices.setString(AppStorage.userTokenKey, tokenKey);
    await Global.storageServices.setString(AppStorage.userProfileKey, profileId);
  }

  Future<void> executeLoginByAccount(String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        toastInfor(text: 'Vui lòng nhập đầy đủ thông tin');
        return;
      }
      EasyLoading.show(status: 'Đang đăng nhập...');
      final response = await _authUseCase.signIn(email, password);
      if (response is AppResultSuccess<UserPostModel>) {
        toastSuccess(text: AppStrings.signInSuccess);
        if (isSavePassword.value) {
          // save token and profileId to local storage
          saveToken(response.netData!.token, response.netData!.id);
        }
        Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
      }
      if (response is AppResultFailure) {
        toastError(text: AppStrings.signInFailed);
      }
    } catch (e) {
      toastError(text: AppStrings.signInFailed1);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
