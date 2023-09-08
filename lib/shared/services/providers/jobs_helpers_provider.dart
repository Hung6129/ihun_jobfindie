import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/shared/models/job/job_model.dart';
import 'package:ihun_jobfindie/shared/services/helpers/job_helper.dart';

final allJobsHelperProvider = FutureProvider<List<JobModel>>((ref) async {
  final helper = ref.watch(jobHelperClassProvider);
  return helper.fetchAllJobs();
});

