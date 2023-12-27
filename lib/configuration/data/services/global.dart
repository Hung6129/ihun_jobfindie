import 'package:ihun_jobfindie/configuration/data/services/storage_helper.dart';
import 'package:logger/logger.dart';

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
  }
}
