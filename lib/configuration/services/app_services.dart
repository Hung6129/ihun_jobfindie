import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:ihun_jobfindie/shared/widgets/app_snackbar.dart';
import 'package:logger/logger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:rxdart/rxdart.dart';

abstract class AppService extends GetxService {
  void forceLogout();
}

class AppServiceImpl extends AppService {
  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onInit() {
    super.onInit();
    _initOneSignal();
  }

  @override
  void forceLogout() async {
    // removeUserInfor
    CombineLatestStream.list([
      Global.storageServices.removeUserInforS().asStream(),
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

  void _initOneSignal() {
    _logger.i("Init OneSignal");

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);

    OneSignal.consentRequired(true);
    //
    OneSignal.initialize("c4ba9d07-6561-4f55-b39b-fffea28425f2");
    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android
    // push notification prompt. We recommend removing the following code and instead using
    // an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);

    OneSignal.Notifications.addPermissionObserver((state) {
      _logger.i("Has permission " + state.toString());
    });
  }
}
