import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';

import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';

import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../configuration/constants/app_storage.dart';
import '../../../jobs/data/models/job_home_model.dart';

class CandidateController extends GetxController {
  late final AuthenUseCase _authUseCase;
  late final JobUseCase _jobUseCase;
  CandidateController(
    this._authUseCase,
    this._jobUseCase,
  );
  Rxn<UserProfileModel?> profileModel = Rxn();
  Rxn<List<JobHomeModel>> listJobModel = Rxn();
  RxBool isAgent = false.obs;

  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onInit() async {
    super.onInit();
    var agentId = await Global.storageServices.getString(AppStorage.userProfileKey);
    CombineLatestStream(
      [
        _fetchData().asStream(),
        _fetchJobsByAgentId(agentId).asStream(),
      ],
      (List<dynamic> values) => values,
    );
  }

  Future<void> _fetchJobsByAgentId(String agentId) async {
    try {
      final response = await _jobUseCase.fetchJobsByAgentId(agentId);
      if (response is AppResultSuccess<List<JobHomeModel>>) {
        listJobModel.value = response.netData;
      }
      if (response is AppResultFailure) {
        _logger.e('error when fetch list job');
      }
    } catch (e) {
      _logger.e('error when fetch list job in catch $e');
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  Future<void> _fetchData() async {
    try {
      final response = await _authUseCase.getProfile();
      if (response is AppResultSuccess<UserProfileModel>) {
        profileModel.value = response.netData;
        isAgent.value = response.netData?.isAgent ?? false;
      }
      if (response is AppResultFailure) {
        _logger.e('error when fetch profile');
      }
    } catch (e) {
      _logger.e('error when fetch profile in catch $e');
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  Future<void> signOut() async {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () async {
              // Remove all user information in storage
              await Global.storageServices.removeUserInfor;
              Get.offAllNamed(AppRoutes.signIn);
            },
            child: Text('Đăng xuất'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
        ],
      ),
    );
  }
}
