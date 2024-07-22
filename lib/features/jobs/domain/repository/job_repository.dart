import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/datasource/job_datasource_remote.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';

abstract class JobRepository {
  Future<AppResult<List<JobHomeModel>>> fetchAllJobs();

  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs();

  Future<AppResult<JobModel>> fetchJobDetail(String id);

  Future<AppResult<UserProfileModel>> fetchRecruiterInfor(String id);

  Future<AppResult<List<JobHomeModel>>> fetchJobsByAgentId(String agentId);
}

class JobRepositoryImpl implements JobRepository {
  late final JobDataSourceRemote _jobDataSourceRemote;
  JobRepositoryImpl(this._jobDataSourceRemote);
  @override
  Future<AppResult<List<JobHomeModel>>> fetchAllJobs() {
    return _jobDataSourceRemote.fetchAllJobs();
  }

  @override
  Future<AppResult<JobModel>> fetchJobDetail(String id) {
    return _jobDataSourceRemote.fetchJobDetail(id);
  }

  @override
  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs() {
    return _jobDataSourceRemote.fetchTrendingJobs();
  }

  @override
  Future<AppResult<UserProfileModel>> fetchRecruiterInfor(String id) {
    return _jobDataSourceRemote.fetchRecruiterInfor(id);
  }

  @override
  Future<AppResult<List<JobHomeModel>>> fetchJobsByAgentId(String agentId) {
    return _jobDataSourceRemote.fetchJobsByAgentId(agentId);
  }
}
