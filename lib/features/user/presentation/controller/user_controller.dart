import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/authen_usecase/authen_usecase.dart';
import 'package:ihun_jobfindie/features/jobs/domain/job_usecase/job_usecase.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:logger/logger.dart';
import '../../../../configuration/constants/app_storage.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../jobs/data/models/job_home_model.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;

class UserController extends GetxController {
  late final AuthenUseCase _authUseCase;
  late final JobUseCase _jobUseCase;
  UserController(
    this._authUseCase,
    this._jobUseCase,
  );
  Rxn<UserProfileModel?> profileModel = Rxn();
  Rxn<List<JobHomeModel>> listJobModel = Rxn();
  RxBool isAgent = false.obs;

  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  String? fileName;
  List<PlatformFile>? paths;
  String? directoryPath;
  String? extension;

  @override
  void onInit() async {
    super.onInit();
    await _fetchData();
    await _getResumeFileFormFirebaseStorage();
  }

  Future<void> _getResumeFileFormFirebaseStorage() async {
    try {
      if (fileName!.isNotEmpty || fileName != '') {
        final storage = FirebaseStorage.instance.ref();
        final ref = storage
            .child('candidateResume')
            .child('/${Global.storageServices.getString(AppStorage.userProfileKey)}')
            .child('/$fileName');
        _logger.i('ref: $ref');
        final url = await ref.getDownloadURL();
        _logger.i('download url: $url');
      } else {
        _logger.e('file name is empty');
      }
    } on firebase_core.FirebaseException catch (e) {
      _logger.e('Failed to get download URL:' + e.toString());
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e) {
      _logger.e('error when pick file $e');
    }
  }

  Future<void> onPickFile() async {
    try {
      directoryPath = null;
      paths = (await FilePicker.platform.pickFiles(
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions:
            (extension?.isNotEmpty ?? false) ? extension?.replaceAll(' ', '').split(',') : null,
      ))
          ?.files;

      fileName = paths!.map((e) => e.name).toString();
      directoryPath = (paths!.map((e) => e.path)).toList()[0].toString();
      if (paths != null || directoryPath != null) {
        await _uploadUserResumeToFirebaseStorage();
      } else {
        AppSnackbarWidget(
          title: AppStrings.headError,
          message: AppStrings.errorWhenPickFile,
          isError: true,
        ).show(Get.context!);
        return;
      }
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e) {
      _logger.e('error when pick file $e');
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
      await ref.putFile(
        file,
        metadata,
      );
    } on firebase_core.FirebaseException catch (e) {
      _logger.e('Failed to upload file and get download URL:' + e.toString());
    } on PlatformException catch (e) {
      _logger.e('Unsupported operation' + e.toString());
    } catch (e) {
      _logger.e('error when pick file $e');
    }
  }

  Future<void> _fetchJobsApplied(String userId) async {
    try {
      final response = await _jobUseCase.fetchJobsApplied(userId);
      if (response is AppResultSuccess<List<JobHomeModel>>) {
        listJobModel.value = response.netData;
      }
      if (response is AppResultFailure) {
        _logger.e('error when fetch list job');
      }
    } catch (e) {
      _logger.e('error when fetch list job in catch $e');
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  Future<void> _fetchData() async {
    try {
      AppFullScreenLoadingIndicator.show();
      final response = await _authUseCase.getProfile();
      if (response is AppResultSuccess<UserProfileModel>) {
        profileModel.value = response.netData;
        isAgent.value = response.netData?.isAgent ?? false;
        var userId = await Global.storageServices.getString(AppStorage.userProfileKey);
        var resumeFileName = profileModel.value?.resumeFileName;
        _logger.i('resume file name: $resumeFileName');
        if (resumeFileName!.isNotEmpty || resumeFileName == '') {
          fileName = resumeFileName;
        }
        _fetchJobsApplied(userId);
      }
      if (response is AppResultFailure) {
        _logger.e('error when fetch profile');
      }
    } catch (e) {
      _logger.e('error when fetch profile in catch $e');
    } finally {
      AppFullScreenLoadingIndicator.dismiss();
    }
  }

  Future<void> signOut() => showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: [
            TextButton(
              onPressed: () {
                // Remove all user information in storage
                Global.storageServices.removeUserInfor;
                Get.offAllNamed(AppRoutes.signIn);
              },
              child: Text('Đăng xuất'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Hủy'),
            ),
          ],
        ),
      );
}
