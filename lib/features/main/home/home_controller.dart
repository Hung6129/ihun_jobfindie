import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';

class HomeController extends GetxController {
  late final JobUseCase _jobsUseCase;
  Rxn<List<JobModel>> listJobModel = Rxn();

  HomeController(this._jobsUseCase);

  @override
  void onInit() async {
    super.onInit();
    AppFullScreenLoadingIndicator.show();
    await Future.delayed(Duration(seconds: 1));
    fetchListJob();
    AppFullScreenLoadingIndicator.dismiss();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchListJob() async {
    final response = await _jobsUseCase.fetchAllJobs();
    if (response is AppResultSuccess<List<JobModel>>) {
      listJobModel.value = response.netData;
    }
    if (response is AppResultFailure) {
      debugPrint('error when fetch list job');
    }
  }
}
