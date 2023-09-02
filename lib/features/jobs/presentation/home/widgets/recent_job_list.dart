import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/detail/views/job_detail_page.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RecentJobList extends StatelessWidget {
  const RecentJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JobDetailPage(),
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
              leading: const SizedBox(
                child: Icon(
                  AntDesign.linkedin_square,
                  size: 30,
                ),
              ),
              title: Text(
                'Senior Flutter Engineer',
                style: TextStyles.customStyle.mediumText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Linkedin | Remote',
                    style: TextStyles.customStyle.smallText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '2-3 yrs | 5000-10000 USD',
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
  }
}
