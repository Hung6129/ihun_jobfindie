import 'package:ihun_jobfindie/configuration/data/network/nets/app_response.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';

class JobDataSourceRemote implements JobRepository {
  late final NetworkService _networkService;
  JobDataSourceRemote(this._networkService);
  @override
  Future<AppResult<List<JobHomeModel>>> fetchAllJobs() async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        isRequestForList: true,
        url: '/api/job/?limit=25',
        method: HTTPMethod.get,
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final List<JobHomeModel> listData = [];
      final List<dynamic> list = response.netData?.data;
      list.forEach((element) {
        listData.add(JobHomeModel.fromJson(element));
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
        url: '/api/job/find/$id',
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

  @override
  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs() async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        isRequestForList: true,
        url: '/api/job/?limit=10',
        method: HTTPMethod.get,
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final List<JobHomeModel> listData = [];
      final List<dynamic> list = response.netData?.data;
      list.forEach((element) {
        listData.add(JobHomeModel.fromJson(element));
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
  Future<AppResult<UserProfileModel>> fetchRecruiterInfor(String id)async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: '/api/user/recruiter/find/$id',
        method: HTTPMethod.get,
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final UserProfileModel userPro = UserProfileModel.fromJson(response.netData?.data);
      return AppResult.success(userPro);
    }
    if (response is AppResultFailure) {
      return AppResult.failure(
        (response as AppResultFailure).exception,
      );
    }
    return AppResult.exceptionEmpty();
  }
}
