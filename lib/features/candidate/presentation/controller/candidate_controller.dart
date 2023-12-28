// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';

import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';

class CandidateController extends GetxController {
  final _authUseCase = Get.find<AuthenUseCase>();
  Rxn<UserProfileModel?> profileModel = Rxn();
  @override
  void onInit() async {
    super.onInit();
    try {
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.getProfile();
      await Future.delayed(Duration(milliseconds: 300));
      AppFullScreenLoadingIndicator.dismiss();
      if (response is AppResultSuccess<UserProfileModel>) {
        profileModel.value = response.netData;
      }
      if (response is AppResultFailure) {
        debugPrint('error when fetch profile');
      }
    } catch (e) {
      debugPrint('error when fetch profile in catch $e');
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  void signOut() async {
    showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: Text('Bạn có chắc chắn muốn đăng xuất?'),
              actions: [
                TextButton(
                    onPressed: () async {
                      await Global.storageServices.remove(AppStorage.userTokenKey);
                      await Global.storageServices.remove(AppStorage.userProfileKey);
                      await Global.storageServices.remove(AppStorage.isSavePassword);
                      Get.offAllNamed(AppRoutes.signIn);
                    },
                    child: Text('Đăng xuất')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Hủy')),
              ],
            ));
  }
}
