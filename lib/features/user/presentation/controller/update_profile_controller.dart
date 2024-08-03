import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:logger/logger.dart';

import '../../../../configuration/data/network/nets/app_result.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'dart:io' as io;

///
/// Get arguments from profile page, and set to form
/// through value [fileName], [profileModel] and [resumeFileUrl]
///
/// using those two values, we can check if the user has uploaded a file or not
///
class UpdateProfileController extends GetxController {
  late final AuthenUseCase _authUseCase;
  UpdateProfileController(this._authUseCase);

  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));
  final formKey = GlobalKey<FormBuilderState>();
  var userProfile = Get.arguments;
  Rxn<UserProfileModel?> profileModel = Rxn();
  RxDouble progress = 0.0.obs;
  RxBool isShowLoading = false.obs;
  List<PlatformFile>? paths;

  RxString fileName = "".obs;
  RxString directoryPath = ''.obs;
  RxString resumeFileUrl = ''.obs;

  @override
  void onReady() {
    super.onReady();
    setFormValue(userProfile);
  }

  // get arguments from profile page, and set to form
  // through value [fileName] and [profileModel]
  void setFormValue(UserProfileModel userProfile) {
    this.profileModel.value = userProfile;
    fileName.value = userProfile.resumeFileName;
    directoryPath.value = userProfile.resumeFileUrl;
    resumeFileUrl.value = userProfile.resumeFileUrl;
    _logger.i('user profile: $userProfile');

    // set the value to form
    formKey.currentState?.patchValue({
      'username': userProfile.username,
      'email': userProfile.email,
      'bio': userProfile.bio,
      'location': userProfile.location,
      'phoneNum': userProfile.phoneNum,
      'resumeFileName': userProfile.resumeFileName,
      'resumeFileUrl': userProfile.resumeFileUrl,
    });
  }

  Future<void> updateProfile() async {
    if (formKey.currentState!.saveAndValidate()) {
      await _callUpdateProfile(profileModel.value!.copyWith(
        username: formKey.currentState!.fields['username']!.value as String,
        email: formKey.currentState!.fields['email']!.value as String,
        bio: formKey.currentState!.fields['bio']!.value as String,
        location: formKey.currentState!.fields['location']!.value as String,
        phoneNum: formKey.currentState!.fields['phoneNum']!.value as String,
        resumeFileName: fileName.value,
        resumeFileUrl: resumeFileUrl.value,
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

  Future<String> _getResumeFileFormFirebaseStorage(
    String fileName,
  ) async {
    try {
      final storage = FirebaseStorage.instance.ref();
      final ref = storage
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$fileName');
      final url = await ref.getDownloadURL();
      _logger.i('download url: $url');
      return url;
    } on firebase_core.FirebaseException catch (e) {
      _logger.e('Failed to get download URL:' + e.toString());
      rethrow;
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
      rethrow;
    } catch (e) {
      _logger.e('error when get download url $e');
      rethrow;
    }
  }

  Future<void> onPickFile() async {
    try {
      paths = (await FilePicker.platform.pickFiles(
        onFileLoading: (FilePickerStatus status) => print(status),
      ))
          ?.files;
      if (paths != null) {
        // check [fileName] is not empty, then upload
        // new file and delete the old file
        if (fileName.value.isNotEmpty) {
          await _uploadNewUserResumeToFirebaseStorageAndDeleteOldFile(
            // pass the new file name and directory
            newName: paths!.map((e) => e.name).toString(),
            newDirectory: (paths!.map((e) => e.path)).toList()[0].toString(),
            // pass the old file name and directory
            oldName: fileName.value,
            oldDirectory: directoryPath.value,
          );
        } else {
          // set the value to [fileName] and [directoryPath]
          // to the file that user just picked
          fileName.value = paths!.map((e) => e.name).toString();
          directoryPath.value = (paths!.map((e) => e.path)).toList()[0].toString();
          await _uploadUserResumeToFirebaseStorage(
            name: fileName.value,
            directory: directoryPath.value,
          );
        }
      } else {
        return AppSnackbarWidget(
          title: AppStrings.headWaring,
          message: AppStrings.warningWhenPickFile,
          isWaring: true,
        ).show(Get.context!);
      }
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e, str) {
      _logger.e('error when pick file $e $str');
    }
  }

  Future<void> _uploadUserResumeToFirebaseStorage({
    required String name,
    required String directory,
  }) async {
    try {
      final storage = FirebaseStorage.instance.ref();
      // Create a reference to the location you want to upload to in firebase
      final ref = storage
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$name');
      io.File file = io.File(directory);
      // check if the file is exist
      if (!file.existsSync()) {
        _logger.e('file not exist');
        return AppSnackbarWidget(
          title: AppStrings.headError,
          message: AppStrings.errorWhenPickFile,
          isError: true,
        ).show(Get.context!);
      }

      final metadata = SettableMetadata(
        contentType: 'application/pdf',
        customMetadata: {
          'picked-file-path': file.path,
        },
      );
      _logger.i('file path: ${file.path}');

      await ref.putFile(file, metadata).snapshotEvents.listen((event) async {
        isShowLoading.value = true;
        if (event.totalBytes != 0) {
          progress.value = ((event.bytesTransferred / event.totalBytes) * 100).toDouble();
        } else {
          progress.value = 0.0;
        }
        if (event.state == TaskState.success) {
          final urlDown = await _getResumeFileFormFirebaseStorage(name);
          resumeFileUrl.value = urlDown;
          await _callUpdateProfile(
            profileModel.value!.copyWith(
              resumeFileName: name,
              resumeFileUrl: urlDown,
            ),
          );
          isShowLoading.value = false;
          AppSnackbarWidget(
            title: AppStrings.headSuccess,
            message: AppStrings.uploadFileSuccess,
            isError: false,
          ).show(Get.context!);
        }
        if (event.state == TaskState.error) {
          isShowLoading.value = false;
          AppSnackbarWidget(
            title: AppStrings.headError,
            message: AppStrings.errorWhenUploadFile,
            isError: true,
          ).show(Get.context!);
        }
      });
    } on firebase_core.FirebaseException catch (e) {
      _logger.e('Failed to upload file and get download URL:' + e.toString());
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e) {
      _logger.e('Failed to upload file and get download URL:' + e.toString());
    }
  }

  Future<void> _uploadNewUserResumeToFirebaseStorageAndDeleteOldFile({
    required String newName,
    required String newDirectory,
    required String oldName,
    required String oldDirectory,
  }) async {
    try {
      /// Get the old file on firebase storage
      final oldStorage = FirebaseStorage.instance
          .ref()
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$oldName');

      await oldStorage.delete();

      _logger.i('old file deleted');

      /// Create a new reference
      final newStorage = FirebaseStorage.instance
          .ref()
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$newName');

      io.File file = io.File(newDirectory);

      if (!file.existsSync()) {
        _logger.e('file not exist');
        AppSnackbarWidget(
          title: AppStrings.headError,
          message: AppStrings.errorWhenPickFile,
          isError: true,
        ).show(Get.context!);
        return;
      }

      final metadata = SettableMetadata(
        contentType: 'application/pdf',
        customMetadata: {
          'picked-file-path': file.path,
        },
      );
      _logger.i('file path: ${file.path}');

      await newStorage.putFile(file, metadata).snapshotEvents.listen((event) async {
        isShowLoading.value = true;
        if (event.totalBytes != 0) {
          progress.value = ((event.bytesTransferred / event.totalBytes) * 100).toDouble();
        } else {
          progress.value = 0.0;
        }
        if (event.state == TaskState.success) {
          final urlDown = await _getResumeFileFormFirebaseStorage(newName);
          fileName.value = newName;
          directoryPath.value = newDirectory;
          resumeFileUrl.value = urlDown;
          await _callUpdateProfile(
            profileModel.value!.copyWith(
              resumeFileName: newName,
              resumeFileUrl: urlDown,
            ),
          );
          isShowLoading.value = false;
          AppSnackbarWidget(
            title: AppStrings.headSuccess,
            message: AppStrings.uploadFileSuccess,
            isError: false,
          ).show(Get.context!);
        }
        if (event.state == TaskState.error) {
          isShowLoading.value = false;
          AppSnackbarWidget(
            title: AppStrings.headError,
            message: AppStrings.errorWhenUploadFile,
            isError: true,
          ).show(Get.context!);
        }
      });
    } on firebase_core.FirebaseException catch (e) {
      _logger.e('Failed to upload file and get download URL:' + e.toString());
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e) {
      _logger.e('Failed to upload file and get download URL:' + e.toString());
    }
  }

  Future<void> onDeleteResumeFile({
    required String fileName,
  }) async {
    try {
      AppFullScreenLoadingIndicator.show();
      final oldStorage = FirebaseStorage.instance
          .ref()
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$fileName');

      await oldStorage.delete();

      this.fileName.value = '';
      this.directoryPath.value = '';
      this.resumeFileUrl.value = '';

      await _callUpdateProfile(
        profileModel.value!.copyWith(
          resumeFileName: '',
          resumeFileUrl: '',
        ),
      );
      AppFullScreenLoadingIndicator.dismiss();
      AppSnackbarWidget(
        title: AppStrings.headSuccess,
        message: 'File deleted successfully',
        isError: false,
      ).show(Get.context!);
    } catch (e) {}
  }
}
