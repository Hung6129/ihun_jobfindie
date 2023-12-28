import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';
import 'package:ihun_jobfindie/features/jobs/domain/repository/job_repository.dart';

abstract class JobUseCase {
  Future<AppResult<List<JobModel>>> fetchAllJobs();
}

class JobUseCaseImpl implements JobUseCase {
  late final JobRepository _jobRepository;
  JobUseCaseImpl(this._jobRepository);
  @override
  Future<AppResult<List<JobModel>>> fetchAllJobs() {
    return _jobRepository.fetchAllJobs();
  }
}
