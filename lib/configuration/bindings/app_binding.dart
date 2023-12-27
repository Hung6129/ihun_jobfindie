import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';

import 'package:ihun_jobfindie/features/authenticate/data/datasource/authen_datasource_remote.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';
import 'package:ihun_jobfindie/features/main/main_controller.dart';

import 'package:ihun_jobfindie/features/walk_through/walk_through_controller.dart';

import 'package:ihun_jobfindie/features/welcome/welcome_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WalkThroughController());
    Get.put(MainController());
    Get.put(WelcomeController());

    Get.put<NetworkService>(NetworkServiceImpl());

    Get.lazyPut<AuthenUseCase>(() => AuthenUseCaseImpl(Get.find()));

    Get.lazyPut<AuthenticateRepository>(
        () => AuthenticateRepositoryImpl(Get.find()));

    Get.lazyPut<AuthenDataSourceRemote>(
        () => AuthenDataSourceRemote(Get.find()));
  }
}
