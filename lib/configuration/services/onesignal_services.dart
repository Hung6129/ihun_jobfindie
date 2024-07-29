import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

abstract class OnesignalServices extends GetxController {
  Future<void> initOneSignal();
}

class OnesignalServicesImpl extends OnesignalServices {
  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onInit() {
    super.onInit();
    initOneSignal();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initOneSignal() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(true);

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    OneSignal.initialize("c4ba9d07-6561-4f55-b39b-fffea28425f2");

    OneSignal.LiveActivities.setupDefault();
    // OneSignal.LiveActivities.setupDefault(options: new LiveActivitySetupOptions(enablePushToStart: false, enablePushToUpdate: true));

    // AndroidOnly stat only
    // OneSignal.Notifications.removeNotification(1);
    // OneSignal.Notifications.removeGroupedNotifications("group5");

    OneSignal.Notifications.clearAll();

    OneSignal.User.pushSubscription.addObserver((state) {
      _logger.i(OneSignal.User.pushSubscription.optedIn);
      _logger.i(OneSignal.User.pushSubscription.id);
      _logger.i(OneSignal.User.pushSubscription.token);
      _logger.i(state.current.jsonRepresentation());
    });

    OneSignal.User.addObserver((state) {
      var userState = state.jsonRepresentation();
      _logger.i('OneSignal user changed: $userState');
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      _logger.i("Has permission " + state.toString());
    });

    OneSignal.Notifications.addClickListener((event) {
      _logger.i('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      _logger.i(
          'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();
    });

    OneSignal.InAppMessages.addClickListener((event) {});
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      _logger.i("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      _logger.i("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      _logger.i("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      _logger.i("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    });

    OneSignal.InAppMessages.paused(true);
  }
}
