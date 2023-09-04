import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/features/jobs/detail/views/job_detail_page.dart';
import 'package:ihun_jobfindie/shared/services/providers/job_helper_provider.dart';

import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_btn_lbl.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class SuggestedJobCarouselList extends ConsumerWidget {
  const SuggestedJobCarouselList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAllJob = ref.watch(jobHelperProvider);

    return listAllJob.when(
      data: (data) {
        return SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final job = data[index];
              final jobDate = DateTime.parse(job.date);
              final timeAgo = timeago.format(jobDate);
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
                  width: 310.w,
                  height: 200.h,
                  margin: leftPadding16,
                  padding: allPadding8,
                  decoration: BoxDecoration(
                    color: Palettes.p8,
                    border: borderAllBlackThin,
                    borderRadius: borderRadius12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70.h,
                        width: 300.w,
                        child: Row(
                          children: [
                            AppCachedNetworkImage(
                              imageUrl: job.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            horizontalMargin12,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    job.title,
                                    style: TextStyles.customStyle.mediumText,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    job.company,
                                    style: TextStyles.customStyle.smallText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        job.description,
                        style: TextStyles.defaultStyle.smallText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalMargin4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppBtnLabel(
                            label: job.contract,
                            labelColor: Palettes.textWhite,
                            bgColor: Palettes.p3,
                            // iconData: AntDesign.clockcircleo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            onPressed: () {},
                            // iconColor: Palettes.textWhite,
                          ),
                          horizontalMargin4,
                          AppBtnLabel(
                            label: job.modality,
                            labelColor: Palettes.textWhite,
                            bgColor: Palettes.p1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            onPressed: () {},
                          ),
                          horizontalMargin4,
                          AppBtnLabel(
                            label: '${job.salary} / ${job.period}',
                            labelColor: Palettes.textWhite,
                            bgColor: Palettes.p2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('20 applicants',
                              style:
                                  TextStyles.customStyle.smallText.underLine),
                          Text(
                            timeAgo,
                            style: TextStyles.customStyle.smallText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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
