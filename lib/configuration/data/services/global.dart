import 'package:ihun_jobfindie/configuration/data/services/storage_helper.dart';
import 'package:logger/logger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// Make a global class to store all the global variables
class Global {
  Global._();
  static final Global instance = Global._();

  static late StorageServices storageServices;

  static late Logger logger;

  Future init() async {
    storageServices = await StorageServices().init();

    /// Logger config
    logger = Logger(printer: PrettyPrinter(methodCount: 0));

    _initOneSignal();
  }

  void _initOneSignal() {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(true);
    OneSignal.initialize("c4ba9d07-6561-4f55-b39b-fffea28425f2");
    OneSignal.Notifications.addPermissionObserver((state) {
      logger.i("Has permission " + state.toString());
    });
  }
}
