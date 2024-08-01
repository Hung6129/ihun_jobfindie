import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';

import 'package:ihun_jobfindie/features/authenticate/data/datasource/authen_datasource_remote.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';
import 'package:ihun_jobfindie/features/jobs/data/datasource/job_datasource_remote.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {


    Get.put<NetworkService>(NetworkServiceImpl());

//
    Get.lazyPut<AuthenUseCase>(() => AuthenUseCaseImpl(Get.find()));

    Get.lazyPut<AuthenticateRepository>(() => AuthenticateRepositoryImpl(Get.find()));

    Get.lazyPut<AuthenDataSourceRemote>(() => AuthenDataSourceRemote(Get.find()));

//
    Get.lazyPut<JobUseCase>(() => JobUseCaseImpl(Get.find()));

    Get.lazyPut<JobRepository>(() => JobRepositoryImpl(Get.find()));

    Get.lazyPut<JobDataSourceRemote>(() => JobDataSourceRemote(Get.find()));
  }
}
