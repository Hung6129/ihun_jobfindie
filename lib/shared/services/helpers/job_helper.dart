import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/configuration/constants/app_urls.dart';
import 'package:ihun_jobfindie/shared/models/job_model.dart';
import 'package:ihun_jobfindie/shared/widgets/flutter_toast.dart';

final jobHelperClassProvider = Provider<JobHelper>((ref) {
  return JobHelper();
});

class JobHelper {
  Dio dio = Dio();
  Future<List<JobModel>> fetchAllJobs() async {
    try {
      var response = await dio.get(
        AppUrls.baseUrl + AppUrls.allProducts,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        final listJob = res as List;
        final listJobModel = listJob.map((e) => JobModel.fromJson(e)).toList();
        return listJobModel;
      } else {
        return [];
      }
    } on DioException catch (e) {
      toastInfor(text: e.toString());
      return [];
    }
  }
}
