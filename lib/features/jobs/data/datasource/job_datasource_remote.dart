import 'package:ihun_jobfindie/configuration/data/network/nets/app_response.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';

class JobDataSourceRemote implements JobRepository {
  late final NetworkService _networkService;
  JobDataSourceRemote(this._networkService);
  @override
  Future<AppResult<List<JobModel>>> fetchAllJobs() async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        isRequestForList: true,
        url: '/api/job/?limit=18',
        method: HTTPMethod.get,
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final List<JobModel> listData = [];
      final List<dynamic> list = response.netData?.data;
      list.forEach((element) {
        listData.add(JobModel.fromJson(element));
      });
      return AppResult.success(listData);
    }
    if (response is AppResultFailure) {
      return AppResult.failure(
        (response as AppResultFailure).exception,
      );
    }
    return AppResult.exceptionEmpty();
  }

  @override
  Future<AppResult<JobModel>> fetchJobDetail(String id) async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: '/api/job/$id',
        method: HTTPMethod.get,
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final JobModel data = JobModel.fromJson(response.netData?.data);
      return AppResult.success(data);
    }
    if (response is AppResultFailure) {
      return AppResult.failure(
        (response as AppResultFailure).exception,
      );
    }
    return AppResult.exceptionEmpty();
  }
}
