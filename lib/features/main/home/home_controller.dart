import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';

class HomeController extends GetxController {
  late final JobUseCase _jobsUseCase;
  late final AuthenUseCase _authUseCase;

  Rxn<List<JobHomeModel>> listJobModel = Rxn();
  Rxn<List<JobHomeModel>> listVIewAllJobModel = Rxn();
  RxString email = ''.obs;
  RxString name = '--'.obs;
  RxString avatar = 'https://i.pinimg.com/474x/68/e5/d3/68e5d30de3741f077cea06f1b1a12a34.jpg'.obs;

  HomeController(this._jobsUseCase, this._authUseCase);

  @override
  void onInit() async {
    super.onInit();
    fetchTrendingJobs();
    getUserInfor();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUserInfor() async {
    final response = await _authUseCase.getProfile();
    if (response is AppResultSuccess<UserProfileModel>) {
      email.value = response.netData?.email ?? '';
      name.value = response.netData?.username ?? '';
      avatar.value = response.netData?.avatar ?? '';
    }
    if (response is AppResultFailure) {
      debugPrint('error when get user name and email');
    }
  }

  void fetchTrendingJobs() async {
    AppFullScreenLoadingIndicator.show();
    await Future.delayed(Duration(seconds: 1));
    final response = await _jobsUseCase.fetchTrendingJobs();
    AppFullScreenLoadingIndicator.dismiss();
    if (response is AppResultSuccess<List<JobHomeModel>>) {
      listJobModel.value = response.netData;
    }
    if (response is AppResultFailure) {
      debugPrint('error when fetch list job');
    }
  }

  void fetchTrendingViewAll() async {
    AppFullScreenLoadingIndicator.show();
    await Future.delayed(Duration(seconds: 1));
    final response = await _jobsUseCase.fetchAllJobs();
    AppFullScreenLoadingIndicator.dismiss();
    if (response is AppResultSuccess<List<JobHomeModel>>) {
      listVIewAllJobModel.value = response.netData;
    }
    if (response is AppResultFailure) {
      debugPrint('error when fetch list job');
    }
  }

  void onJobItemPressed(String jobId) {
    Get.toNamed(AppRoutes.jobDetail, arguments: jobId);
  }
}
