import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:logger/logger.dart';

import '../../../../configuration/data/network/nets/app_result.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../authenticate/domain/authen_usecase/authen_usecase.dart';

class UpdateProfileController extends GetxController {
  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  final formKey = GlobalKey<FormBuilderState>();

  var userProfile = Get.arguments as UserProfileModel;

  late final AuthenUseCase _authUseCase;

  Rxn<UserProfileModel?> profileModel = Rxn();

  UpdateProfileController(this._authUseCase);

  @override
  void onReady() {
    super.onReady();
    _logger.i('UpdateProfileController is ready');
    setFormValue(userProfile);
  }

  @override
  void onInit() {
    super.onInit();
  }

  // get arguments from profile page, and set to form
  void setFormValue(UserProfileModel userProfile) {
    this.profileModel.value = userProfile;
    formKey.currentState?.patchValue({
      'username': userProfile.username,
      'email': userProfile.email,
      'bio': userProfile.bio,
      'location': userProfile.location,
      'phoneNum': userProfile.phoneNum,
    });
  }

  void updateProfile() async {
    if (formKey.currentState!.saveAndValidate()) {
      await _callUpdateProfile(profileModel.value!.copyWith(
        username: formKey.currentState!.fields['username']!.value as String,
        email: formKey.currentState!.fields['email']!.value as String,
        bio: formKey.currentState!.fields['bio']!.value as String,
        location: formKey.currentState!.fields['location']!.value as String,
        phoneNum: formKey.currentState!.fields['phoneNum']!.value as String,
      ));
    }
  }

  // get the value from form, and update the profile
  Future<void> _callUpdateProfile(
    UserProfileModel profileModel,
  ) async {
    try {
      final data = await _authUseCase.updateUserProfile(profileModel);
      if (data is AppResultSuccess<UserProfileModel>) {
        this.profileModel.value = data.netData;
        AppSnackbarWidget(
          title: AppStrings.headSuccess,
          message: AppStrings.updateProfileSuccess,
          isError: false,
        ).show(Get.context!);
      } else if (data is AppResultFailure) {
        _logger.e('error when update profile');
        AppSnackbarWidget(
          title: AppStrings.headError,
          message: AppStrings.errorWhenUpdateProfile,
          isError: true,
        ).show(Get.context!);
      }
    } catch (e) {
      _logger.e('error when update profile in catch $e');
      rethrow;
    }
  }
}
