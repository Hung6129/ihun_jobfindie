import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/configuration/global.dart';

final isFirstTimeOpenProvider = Provider<bool>((ref) {
  return Global.storageServices.getIsFirstTime();
});

final isSignedInProvider = Provider<bool>((ref) {
  return Global.storageServices.getIsSignedIn();
});
