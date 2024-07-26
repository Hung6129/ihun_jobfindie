import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:ihun_jobfindie/shared/widgets/app_snackbar.dart';
import 'package:rxdart/rxdart.dart';

abstract class AppService extends GetxService {
  void forceLogout();
}

class AppServiceImpl extends AppService {
  @override
  void forceLogout() async {
    // removeUserInfor
    CombineLatestStream.list([
      Global.storageServices.removeUserInfor().asStream(),
    ]).listen(
      (value) {
        Get.offAllNamed(AppRoutes.signIn);
        AppFullScreenLoadingIndicator.dismiss();
        AppSnackbarWidget(
          duration: const Duration(seconds: 5),
          title: 'Phiên đăng nhập đã hết hạn',
          message: 'Vui lòng đăng nhập lại',
          isError: true,
        ).show(Get.context!);
      },
    );
  }
}
