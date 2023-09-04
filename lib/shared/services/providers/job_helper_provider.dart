import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ihun_jobfindie/shared/models/job_model.dart';
import 'package:ihun_jobfindie/shared/services/helpers/job_helper.dart';

final jobHelperProvider = FutureProvider<List<JobModel>>((ref) async {
  final helper = ref.watch(jobHelperClassProvider);
  return helper.fetchAllJobs();
});
