import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/configuration/styles/palettes.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../detail/views/job_detail_page.dart';

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
            margin: EdgeInsets.only(left: 25.w, bottom: 20.h),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Palettes.p8,
              border: Border.all(
                color: Palettes.textBlack,
                width: 0.2,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: ListTile(
              leading: const SizedBox(
                child: Icon(
                  AntDesign.linkedin_square,
                  size: 40,
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
