import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';

class WalkThroughController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    final isFirstTimeOpen = Global.storageServices.getIsFirstTime();
    final isSavePassword = Global.storageServices.isSavePassword();
    final isUserToken = Global.storageServices.getString(AppStorage.userTokenKey);
    await Future.delayed(const Duration(seconds: 1));
    if (isFirstTimeOpen == true) {
      Get.offAllNamed(AppRoutes.wellcome);
    } else if (isSavePassword == true && isUserToken.isNotEmpty) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.signIn);
    }
  }
}
