import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/features/jobs/detail/views/job_detail_page.dart';
import 'package:ihun_jobfindie/shared/services/providers/jobs_helpers_provider.dart';

import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';

class RecentJobList extends ConsumerWidget {
  const RecentJobList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAllJob = ref.watch(allJobsHelperProvider);
    return listAllJob.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final job = data[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailPage(
                      jobModel: job,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.w, bottom: 15.h),
                padding: allPadding8,
                decoration: BoxDecoration(
                  color: Palettes.p8,
                  border: borderAllBlackThin,
                  borderRadius: const BorderRadius.only(
                      topLeft: radius12, bottomLeft: radius12),
                ),
                child: ListTile(
                  leading: AppCachedNetworkImage(
                    imageUrl: job.imageUrl,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    job.title,
                    style: TextStyles.customStyle.mediumText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${job.company} | ${job.modality}',
                        style: TextStyles.customStyle.smallText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${job.salary} / ${job.period}',
                        style: TextStyles.customStyle.smallText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  trailing: const Icon(Ionicons.bookmarks_outline),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text('Error'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
