import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/jobs/data/datasource/job_datasource_remote.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_model.dart';

abstract class JobRepository {
  Future<AppResult<List<JobModel>>> fetchAllJobs();
}

class JobRepositoryImpl implements JobRepository {
  late final JobDataSourceRemote _jobDataSourceRemote;
  JobRepositoryImpl(this._jobDataSourceRemote);
  @override
  Future<AppResult<List<JobModel>>> fetchAllJobs() {
    return _jobDataSourceRemote.fetchAllJobs();
  }
}