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
import 'package:ihun_jobfindie/shared/widgets/app_sliverappbar.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(
      init: JobController(Get.find()),
      builder: (controller) => Scaffold(
        body: Obx(
          () => AppSilverBarWidget(
            expandedHeight: 50.h,
            collapsedHeight: 30.h,
            toolbarHeight: 30.h,
            bgColor: Palettes.textWhite,
            leadingWidget: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.black,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // Show bottom sheet to share
                },
                child: Icon(
                  FontAwesomeIcons.share,
                  color: Colors.black,
                ),
              ),
              horizontalMargin24,
              GestureDetector(
                onTap: () {
                  // Add to favorite
                },
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ),
              ),
              horizontalMargin24,
            ],
            children: [
              _buildBody(controller),
            ],
          ),
        ),
        floatingActionButton: _buidFAB(),
      ),
    );
  }

  Widget _buidFAB() {
    return Column(
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
            FontAwesomeIcons.solidMessage,
            color: Palettes.textWhite,
          ),
          backgroundColor: Palettes.p1,
        ),
      ],
    );
  }

  Widget _buildBody(JobController controller) {
    return Container(
      height: 1.sh,
      color: Palettes.textWhite,
      child: Column(
        children: [
          _buildCompanyInfor(controller),
          verticalMargin24,
          _buildRowIcon(controller),
          _buildTabs(controller),
        ],
      ),
    );
  }

  Widget _buildCompanyInfor(
    JobController controller,
  ) {
    return Column(
      children: [
        AppCachedNetworkImage(
          width: 100.w,
          imageUrl: controller.jobModel.value?.imageUrl ?? '',
          fit: BoxFit.cover,
        ),
        verticalMargin4,
        Text(
          controller.jobModel.value?.title ?? '--',
          style: TextStyles.defaultStyle.appTitle,
        ),
        verticalMargin8,
        Text(
          controller.jobModel.value?.company ?? '--',
          style: TextStyles.defaultStyle.mediumText,
        ),
        verticalMargin4,
        Text(
          controller.jobModel.value?.location ?? '--',
          style: TextStyles.defaultStyle,
        ),
        verticalMargin4,
        Text(
          '${controller.recruiterName.value ?? '--'}  -  ${controller.jobModel.value?.date ?? '--'}',
          style: TextStyles.defaultStyle.smallText,
        ),
      ],
    );
  }

  Widget _buildTabs(
    JobController controller,
  ) {
    return Column(
      children: [
        FlutterToggleTab(
          width: 80.w,
          borderRadius: 15.r,
          height: 35.h,
          selectedIndex: controller.selectedIndex.value,
          selectedBackgroundColors: [Palettes.p3],
          selectedTextStyle: TextStyles.defaultStyle.mediumText.bold.whiteText,
          unSelectedTextStyle: TextStyles.defaultStyle.mediumText,
          labels: [
            "Description",
            "Requirement",
          ],
          selectedLabelIndex: (index) => controller.selectedIndex.value = index,
          isScroll: false,
        ),

        /// description and requirement content
        Obx(
          () => controller.selectedIndex.value == 0
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
                            FontAwesomeIcons.handPointRight,
                            color: Palettes.getRandomColor(),
                            size: 20.sp,
                          ),
                          horizontalMargin8,
                          Expanded(
                            child: Text(
                              controller.jobModel.value?.requirement[index] ?? '',
                              style: TextStyles.defaultStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }

  Widget _buildRowIcon(
    JobController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextIcon(
          text:
              '${controller.jobModel.value?.salary ?? '--'} / ${controller.jobModel.value?.period ?? '--'}',
          icon: FontAwesomeIcons.dollarSign,
          iconColor: Palettes.p5,
        ),
        horizontalMargin16,
        TextIcon(
          text: controller.jobModel.value?.contract ?? '--',
          icon: FontAwesomeIcons.briefcase,
          iconColor: Palettes.p6,
        ),
        horizontalMargin16,
        TextIcon(
          text: controller.jobModel.value?.modality ?? '--',
          icon: FontAwesomeIcons.suitcase,
          iconColor: Palettes.p7,
        ),
      ],
    );
  }
}

class TextIcon extends StatelessWidget {
  const TextIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 70.w,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30.sp,
            color: iconColor,
          ),
          Text(
            text,
            style: TextStyles.defaultStyle.smallText,
          ),
        ],
      ),
    );
  }
}
