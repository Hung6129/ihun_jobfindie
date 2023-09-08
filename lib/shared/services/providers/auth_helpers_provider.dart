import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/shared/models/user_profile_model.dart';
import 'package:ihun_jobfindie/shared/services/helpers/authenticate_helper.dart';

final getUserProfileProvider = FutureProvider<UserProfileModel>((ref) async {
  final authHelper = ref.watch(authHelperClassProvider);
  return authHelper.getUserProfile();
});
