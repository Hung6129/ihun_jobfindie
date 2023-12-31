import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';

abstract class JobUseCase {

  Future<AppResult<List<JobHomeModel>>> fetchTrendingJobs();

  Future<AppResult<List<JobHomeModel>>> fetchAllJobs();

  Future<AppResult<JobModel>> fetchJobDetail(String id);
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
}
