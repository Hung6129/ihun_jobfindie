import 'package:ihun_jobfindie/shared/services/helpers/storage_helper.dart';

/// Make a global class to store all the global variables
class Global {
  static late StorageServices storageServices;
  static Future init() async {
    storageServices = await StorageServices().init();
  }
}
