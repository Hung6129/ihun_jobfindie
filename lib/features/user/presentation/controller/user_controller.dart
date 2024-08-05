import 'package:file_picker/file_picker.dart';
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
import 'package:ihun_jobfindie/features/user/presentation/views/update_profile_page.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../configuration/constants/app_storage.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../jobs/data/models/job_home_model.dart';

import '../views/pdf_view_page.dart';

class UserController extends GetxController {
  late final AuthenUseCase _authUseCase;
  late final JobUseCase _jobUseCase;
  UserController(
    this._authUseCase,
    this._jobUseCase,
  );
  Rxn<UserProfileModel?> profileModel = Rxn();
  Rxn<List<JobHomeModel>?> listJobModel = Rxn([]);

  final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  RxDouble progress = 0.0.obs;
  RxBool isShowLoading = false.obs;
  RxString fileName = "".obs;
  List<PlatformFile>? paths;
  String? directoryPath;
  String? extension;

  @override
  void onInit() async {
    super.onInit();
    await _fetchData();
  }

  void openJobDetailPage(String jobId) {
    Get.toNamed(
      AppRoutes.jobDetail,
      arguments: jobId,
    );
  }

  void openUpdateProfilePage() async {
    await Get.to(
      () => UpdateProfilePage(),
      arguments: profileModel.value,
    );
    await _fetchData();
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
        var userId = await Global.storageServices.getString(AppStorage.userProfileKey);
        fileName.value = profileModel.value!.resumeFileName;
        _fetchJobsApplied(userId);
      }
      if (response is AppResultFailure) {
        _logger.e('error when fetch profile');
        AppSnackbarWidget(
          title: AppStrings.headError,
          message: AppStrings.errorWhenFetchProfile,
          isError: true,
        ).show(Get.context!);
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

  void copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    AppSnackbarWidget(
      title: AppStrings.headSuccess,
      message: AppStrings.copiedToClipboard,
      isError: false,
    ).show(Get.context!);
  }

  void callToPhone(String phoneNum) async {
    _logger.i('${Uri(scheme: 'tel', path: phoneNum)}');
    await canLaunchUrl(
      Uri(scheme: 'tel', path: phoneNum),
    ).then((bool result) async {
      if (!result) {
        AppSnackbarWidget(
          title: AppStrings.headError,
          message: 'Could not launch $phoneNum',
          isError: true,
        ).show(Get.context!);
      } else {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: phoneNum,
        );
        await launchUrl(launchUri);
      }
    });
  }

  void openPdfFile(
    String path,
    String fileName,
  ) {
    Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => PDFViewPage(
          path: path,
          fileName: fileName,
        ),
      ),
    );
  }
}
