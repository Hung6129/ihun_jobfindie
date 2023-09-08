import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ihun_jobfindie/configuration/constants/app_urls.dart';
import 'package:ihun_jobfindie/shared/models/job/job_model.dart';

/// Make HTTP request to fetch list job information from the API
/// using [TaskEither] to perform an async request in a composable way.
TaskEither<String, List<JobModel>> fetchJobFromUserInput(String query) {
  return TaskEither.tryCatch(
    () async {
      Dio dio = Dio();
      var response = await dio.get(
        AppUrls.baseUrl + AppUrls.searchProduct + query,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      final res = response.data;
      final listJob = res as List;
      final listJobModel = listJob.map((e) => JobModel.fromJson(e)).toList();
      return listJobModel;
    },
    (error, __) => 'Unknown error: $error',
  );
}

TaskEither<String, List<JobModel>> fetchRandomJob = TaskEither.Do((_) async {
  return _(fetchJobFromUserInput('backend'));
});
