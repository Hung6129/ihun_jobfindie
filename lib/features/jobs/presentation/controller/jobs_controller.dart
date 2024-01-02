import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';

class JobController extends GetxController {
  late final JobUseCase _jobUseCase;
  JobController(this._jobUseCase);
  RxString jobId = ''.obs;
  Rxn<JobModel> jobModel = Rxn();

  Rxn<List<JobHomeModel>> jobHomeModel = Rxn();

  final selectedIndex = 0.obs;


  @override
  void onInit() async {
    super.onInit();
    jobId.value = Get.arguments;
    fetchJobDetails();
  }

  void fetchJobDetails() async {
    AppFullScreenLoadingIndicator.show();
    await Future.delayed(Duration(milliseconds: 300));
    final response = await _jobUseCase.fetchJobDetail(jobId.value);
    if (response is AppResultSuccess<JobModel>) {
      jobModel.value = response.netData;
    }
    if (response is AppResultFailure) {
      debugPrint('Failed to fetch job details');
    }
    AppFullScreenLoadingIndicator.dismiss();
  }
}
