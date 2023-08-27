import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';

import '../../../../../configuration/styles/palettes.dart';
import '../../../../../core/widgets/app_btn_lbl.dart';

class SuggestedJobCarouselList extends StatelessWidget {
  const SuggestedJobCarouselList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 310.w,
            height: 200.h,
            margin: EdgeInsets.only(left: 10.w),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Palettes.p8,
              border: Border.all(
                color: Colors.black,
                width: 0.2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.h,
                  width: 250.w,
                  child: Row(
                    children: [
                      const Icon(
                        AntDesign.linkedin_square,
                        size: 50,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Senior Flutter Engineer',
                              style: TextStyles.customStyle.mediumText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Linkedin | Remote | 2-3 yrs ',
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget.',
                  style: TextStyles.defaultStyle.smallText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBtnLabel(
                      label: 'Full Time',
                      labelColor: Palettes.textWhite,
                      bgColor: Palettes.p3,
                      // iconData: AntDesign.clockcircleo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      onPressed: () {},
                      // iconColor: Palettes.textWhite,
                    ),
                    const SizedBox(width: 5),
                    AppBtnLabel(
                      label: 'Remote',
                      labelColor: Palettes.textWhite,
                      bgColor: Palettes.p1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    AppBtnLabel(
                      label: '10k-20k/month',
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
                        style: TextStyles.customStyle.smallText.underLine),
                    Text(
                      '18 hours ago',
                      style: TextStyles.customStyle.smallText,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
