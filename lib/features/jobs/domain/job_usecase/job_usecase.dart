import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';

abstract class JobUseCase {
  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs();

  Future<AppResult<List<JobHomeModel>>> fetchAllJobs();

  Future<AppResult<JobModel>> fetchJobDetail(String id);

  Future<AppResult<UserProfileModel>> fetchRecruiterInfor(String id);

  Future<AppResult<List<JobHomeModel>>> fetchJobsByAgentId(String agentId);

  Future<AppResult<List<JobHomeModel>>> fetchJobsApplied(String userId);
}

class JobUseCaseImpl implements JobUseCase {
  late final JobRepository _jobRepository;
  JobUseCaseImpl(this._jobRepository);

  @override
  Future<AppResult<List<JobHomeModel>>> fetchAllJobs() {
    return _jobRepository.fetchAllJobs();
  }

  @override
  Future<AppResult<JobModel>> fetchJobDetail(String id) {
    return _jobRepository.fetchJobDetail(id);
  }

  @override
  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs() {
    return _jobRepository.fetchTrendingJobs();
  }

  @override
  Future<AppResult<UserProfileModel>> fetchRecruiterInfor(String id) {
    return _jobRepository.fetchRecruiterInfor(id);
  }

  @override
  Future<AppResult<List<JobHomeModel>>> fetchJobsByAgentId(String agentId) {
    return _jobRepository.fetchJobsByAgentId(agentId);
  }

  @override
  Future<AppResult<List<JobHomeModel>>> fetchJobsApplied(String userId) {
    return _jobRepository.fetchJobsApplied(userId);
  }
}
