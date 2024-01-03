import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/main/home/home_controller.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';
import 'package:ihun_jobfindie/shared/widgets/app_loading_widget.dart';
import 'package:ihun_jobfindie/shared/widgets/app_sliverappbar.dart';
import 'package:ihun_jobfindie/shared/widgets/app_title_viewall.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(Get.find(), Get.find()),
      builder: (controller) => Scaffold(
        backgroundColor: Palettes.textWhite,
        body: AppSilverBarWidget(
          bgColor: Palettes.p2,
          expandedHeight: 80.h,
          toolbarHeight: 80.h,
          collapsedHeight: 80.h,
          titleWidget: Obx(
            () => Row(
              children: [
                horizontalMargin12,
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.profile),
                  child: AppCachedNetworkImage(imageUrl: controller.avatar.value, width: 60.w, height: 60.h),
                ),
                horizontalMargin12,
                Text(
                  'Hi, ${controller.name.value}',
                  style: TextStyles.defaultStyle.appBarTitle.whiteText,
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Badge(
                child: Icon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.white,
                ),
              ),
            ),
            horizontalMargin24
          ],
          children: [
            AppTitleViewAll(
              title: AppStrings.homeTrendingJob,
              onPressed: () {
                Get.toNamed(AppRoutes.jobTrendingViewAll);
                controller.fetchTrendingViewAll();
              },
            ),
            Obx(
              () => controller.listJobModel.value?.length == 0
                  ? AppLoadingWidget()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = controller.listJobModel.value![index];
                        return GestureDetector(
                          onTap: () {
                            controller.onJobItemPressed(data.id);
                          },
                          child: Card(
                            color: Palettes.textWhite,
                            surfaceTintColor: Palettes.textWhite,
                            elevation: 3,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                          ),
                        );
                      },
                      itemCount: controller.listJobModel.value?.length ?? 0,
                      shrinkWrap: true,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
