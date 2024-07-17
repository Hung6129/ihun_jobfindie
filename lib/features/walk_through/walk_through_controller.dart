import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/domain/models/empty_model.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/services/app_services.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';

class WalkThroughController extends GetxController {
  late final AuthenUseCase _authUseCase;
  WalkThroughController(this._authUseCase);
  @override
  void onInit() async {
    super.onInit();
    final isFirstTimeOpen = Global.storageServices.getIsFirstTime();
    final isSavePassword = Global.storageServices.isSavePassword();
    final isUserToken = Global.storageServices.getString(AppStorage.userTokenKey);
    final isUserId = Global.storageServices.getString(AppStorage.userProfileKey);
    await Future.delayed(const Duration(seconds: 1));
    if (isFirstTimeOpen == true) {
      Get.offAllNamed(AppRoutes.wellcome);
    } else if (isSavePassword == true && isUserToken.isNotEmpty && isUserId.isNotEmpty) {
      checkIfTheTokenIsExpired();
    } else {
      Get.offAllNamed(AppRoutes.signIn);
    }
  }

  checkIfTheTokenIsExpired() async {
    final isUserToken = Global.storageServices.getString(AppStorage.userTokenKey);
    final response = await _authUseCase.checkTokenIsExpired(isUserToken);
    if (response is AppResultSuccess<EmptyModel>) {
      Get.offAllNamed(AppRoutes.home);
    }
    if (response is AppResultFailure) {
      Get.find<AppService>().forceLogout();
    }
  }
}
