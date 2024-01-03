import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/features/jobs/presentation/controller/jobs_controller.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(
      init: JobController(Get.find()),
      builder: (controller) => Scaffold(
        body: Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.share,
                    ),
                  ),
                  horizontalMargin24,
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.heart,
                    ),
                  ),
                  horizontalMargin24,
                ],
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        /// company image
                        AppCachedNetworkImage(
                          width: 150.w,
                          imageUrl: controller.jobModel.value?.imageUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                        verticalMargin16,
                        Text(
                          controller.jobModel.value?.title ?? '',
                          style: TextStyles.defaultStyle.appTitle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.sackDollar,
                                      size: 30.sp,
                                      color: Palettes.p5,
                                    ),
                                    Text(
                                      controller.jobModel.value?.salary ?? '',
                                      style: TextStyles.defaultStyle.smallText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              horizontalMargin16,
                              Container(
                                height: 60.h,
                                width: 60.w,
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.businessTime,
                                      size: 30.sp,
                                      color: Palettes.p6,
                                    ),
                                    Text(
                                      controller.jobModel.value?.contract ?? '',
                                      style: TextStyles.defaultStyle.smallText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              horizontalMargin16,
                              Container(
                                height: 60.h,
                                width: 60.w,
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.locationDot,
                                      size: 30.sp,
                                      color: Palettes.p7,
                                    ),
                                    Text(
                                      controller.jobModel.value?.modality ?? '',
                                      style: TextStyles.defaultStyle.smallText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// tabs description and requirement
                        FlutterToggleTab(
                          width: 80.w,
                          borderRadius: 15.r,
                          height: 40.h,
                          selectedIndex: controller.selectedIndex.value,
                          selectedBackgroundColors: [Palettes.p3],
                          selectedTextStyle: TextStyles.defaultStyle.mediumText.bold.whiteText,
                          unSelectedTextStyle: TextStyles.defaultStyle.mediumText,
                          labels: [
                            "Description",
                            "Requirement",
                          ],
                          selectedLabelIndex: (index) {
                            controller.selectedIndex.value = index;
                          },
                          isScroll: false,
                        ),

                        /// description and requirement content
                        Obx(() => controller.selectedIndex.value == 0
                            ? Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Text(
                                  controller.jobModel.value?.description ?? '',
                                  style: TextStyles.defaultStyle.mediumText,
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(top: 16.h, left: 5.w, right: 5.w),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.jobModel.value?.requirement.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.check,
                                          color: Palettes.getRandomColor(),
                                        ),
                                        horizontalMargin8,
                                        Expanded(
                                          child: Text(
                                            controller.jobModel.value?.requirement[index] ?? '',
                                            style: TextStyles.defaultStyle.mediumText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'apply',
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.solidPaperPlane,
                color: Palettes.textWhite,
              ),
              backgroundColor: Palettes.p2,
            ),
            verticalMargin16,
            FloatingActionButton(
              heroTag: 'call',
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.message,
                color: Palettes.textWhite,
              ),
              backgroundColor: Palettes.p1,
            ),
          ],
        ),
      ),
    );
  }
}
