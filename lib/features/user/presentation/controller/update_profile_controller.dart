import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:logger/logger.dart';

import '../../../../configuration/data/network/nets/app_result.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'dart:io' as io;

import '../views/pdf_view_page.dart';

class UpdateProfileController extends GetxController {
  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  final formKey = GlobalKey<FormBuilderState>();

  var userProfile = Get.arguments as UserProfileModel;

  late final AuthenUseCase _authUseCase;

  Rxn<UserProfileModel?> profileModel = Rxn();

  UpdateProfileController(this._authUseCase);

  RxDouble progress = 0.0.obs;
  RxBool isShowLoading = false.obs;
  RxString fileName = "".obs;
  List<PlatformFile>? paths;
  String? directoryPath;
  String? extension;

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
    fileName.value = userProfile.resumeFileName;

    _logger.i('user profile: $userProfile');
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

  void updateProfile() async {
    if (formKey.currentState!.saveAndValidate()) {
      await _callUpdateProfile(profileModel.value!.copyWith(
        username: formKey.currentState!.fields['username']!.value as String,
        email: formKey.currentState!.fields['email']!.value as String,
        bio: formKey.currentState!.fields['bio']!.value as String,
        location: formKey.currentState!.fields['location']!.value as String,
        phoneNum: formKey.currentState!.fields['phoneNum']!.value as String,
        resumeFileName: formKey.currentState!.fields['resumeFileName']!.value as String,
        resumeFileUrl: formKey.currentState!.fields['resumeFileUrl']!.value as String,
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
        allowedExtensions:
            (extension?.isNotEmpty ?? false) ? extension?.replaceAll(' ', '').split(',') : null,
      ))
          ?.files;
      if (paths != null) {
        fileName.value = paths!.map((e) => e.name).toString();
        directoryPath = (paths!.map((e) => e.path)).toList()[0].toString();
        await _uploadUserResumeToFirebaseStorage();
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

  Future<void> onPickFileAndUpdateFile() async {
    try {
      paths = (await FilePicker.platform.pickFiles(
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions:
            (extension?.isNotEmpty ?? false) ? extension?.replaceAll(' ', '').split(',') : null,
      ))
          ?.files;
      if (paths != null) {
        fileName.value = paths!.map((e) => e.name).toString();
        directoryPath = (paths!.map((e) => e.path)).toList()[0].toString();
        await _uploadUserResumeToFirebaseStorage();
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

  Future<void> _uploadUserResumeToFirebaseStorage() async {
    try {
      final storage = FirebaseStorage.instance.ref();
      // Create a reference to the location you want to upload to in firebase
      final ref = storage
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$fileName');
      io.File file = io.File(directoryPath!);

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

      await ref.putFile(file, metadata).snapshotEvents.listen((event) async {
        isShowLoading.value = true;

        _logger.i('Task state: ${event.state}');
        _logger.i('Progress: ${(event.bytesTransferred / event.totalBytes) * 100} %');

        progress.value = (event.bytesTransferred / event.totalBytes) * 100;

        if (event.state == TaskState.success) {
          final urlDown = await _getResumeFileFormFirebaseStorage(fileName.value);
          await _callUpdateProfile(
            profileModel.value!.copyWith(
              resumeFileName: fileName.value,
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

  Future<void> _uploadNewUserResumeToFirebaseStorageAndDeleteOldFile() async {
    try {
      final storage = FirebaseStorage.instance.ref();
      // Create a reference to the location you want to upload to in firebase
      final ref = storage
          .child('candidateResume')
          .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
          .child('/$fileName');
      io.File file = io.File(directoryPath!);

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

      await ref.putFile(file, metadata).snapshotEvents.listen((event) async {
        isShowLoading.value = true;

        _logger.i('Task state: ${event.state}');
        _logger.i('Progress: ${(event.bytesTransferred / event.totalBytes) * 100} %');

        progress.value = (event.bytesTransferred / event.totalBytes) * 100;

        if (event.state == TaskState.success) {
          final urlDown = await _getResumeFileFormFirebaseStorage(fileName.value);
          await _callUpdateProfile(
            profileModel.value!.copyWith(
              resumeFileName: fileName.value,
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

  Future showBottomSheet() {
    return Get.bottomSheet(
      backgroundColor: Colors.white,
      Container(
        height: 150.h,
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.eye),
              title: Text('View file'),
              onTap: () => Navigator.push(
                Get.context!,
                MaterialPageRoute(
                  builder: (context) => PDFViewPage(
                    path: profileModel.value!.resumeFileUrl,
                    fileName: profileModel.value!.resumeFileName,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.penToSquare),
              title: Text('Upload new file'),
              onTap: () async => await onPickFileAndUpdateFile(),
            ),
          ],
        ),
      ),
    );
  }
}
