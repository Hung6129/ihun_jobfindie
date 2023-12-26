import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/flutter_toast.dart';

class AuthenticateController extends GetxController {
  late final AuthenUseCase _authUseCase;
  AuthenticateController(this._authUseCase);
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> executeLoginByAccount(
      String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        toastInfor(text: 'Vui lòng nhập đầy đủ thông tin');
        return;
      }
      EasyLoading.show(status: 'Đang đăng nhập...');
      final response = await _authUseCase.signIn(email, password);
      if (response is AppResultSuccess<UserPostModel>) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (Route<dynamic> route) => false);
      }
      if (response is AppResultFailure) {
        toastInfor(text: 'Đăng nhập thất bại');
      }
    } catch (e) {
      toastInfor(text: 'Có lỗi xảy ra');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
