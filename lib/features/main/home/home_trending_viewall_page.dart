import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/main/home/home_controller.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';
import 'package:ihun_jobfindie/shared/widgets/app_sliverappbar.dart';

import '../../jobs/data/models/job_home_model.dart';

class JobTrendingViewAllPage extends StatelessWidget {
  const JobTrendingViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(Get.find(), Get.find()),
      builder: (controller) => Scaffold(
        body: AppSilverBarWidget(
          children: [
            Obx(() => _buildBody(controller)),
          ],
          expandedHeight: 70.h,
          toolbarHeight: 70.h,
          bgColor: Palettes.p4,
          titleWidget: Text(
            AppStrings.homeTrendingJob,
            style: TextStyles.defaultStyle.appBarTitle,
          ),
          leadingWidget: IconButton(
            onPressed: () => Get.back(),
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Palettes.textBlack,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    HomeController controller,
  ) =>
      ListView.builder(
        padding: EdgeInsets.only(bottom: 50.h),
        physics: BouncingScrollPhysics(),
        itemCount: controller.listVIewAllJobModel.value?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = controller.listVIewAllJobModel.value![index];
          return GestureDetector(
            onTap: () => controller.navToJobDetail(data.id),
            child: _buildCardItem(data),
          );
        },
      );

  Widget _buildCardItem(
    JobHomeModel data,
  ) =>
      Card(
        color: Palettes.textWhite,
        surfaceTintColor: Palettes.textWhite,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              AppCachedNetworkImage(
                imageUrl: data.imageUrl,
                width: 60.w,
              ),
              horizontalMargin24,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      data.title,
                      style: TextStyles.defaultStyle.mediumText.bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(data.company, style: TextStyles.defaultStyle),
                    Text(data.location, style: TextStyles.defaultStyle),
                    verticalMargin12,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.moneyBill,
                          color: Palettes.p2,
                          size: 16.sp,
                        ),
                        horizontalMargin4,
                        Text(data.salary.toString(), style: TextStyles.defaultStyle.smallText),
                        horizontalMargin12,
                        FaIcon(
                          FontAwesomeIcons.suitcase,
                          color: Palettes.p2,
                          size: 16.sp,
                        ),
                        horizontalMargin4,
                        Text(data.modality, style: TextStyles.defaultStyle.smallText),
                        horizontalMargin12,
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Palettes.p2,
                          size: 16.sp,
                        ),
                        horizontalMargin4,
                        Text(data.contract, style: TextStyles.defaultStyle.smallText),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
