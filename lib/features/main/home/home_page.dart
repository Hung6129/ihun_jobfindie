import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/configuration/routes/app_routes.dart';
import 'package:ihun_jobfindie/features/jobs/data/models/job_home_model.dart';
import 'package:ihun_jobfindie/features/main/controller/home_controller.dart';
import 'package:ihun_jobfindie/features/main/home/home_trending_viewall_page.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';
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
          expandedHeight: 70.h,
          toolbarHeight: 70.h,
          collapsedHeight: 70.h,
          titleWidget: _buildAvt(controller),
          actions: [
            GestureDetector(
              onTap: () {
                // Handle nav to notification page
              },
              child: Badge(
                backgroundColor: Palettes.p3,
                label: Container(
                  width: 8,
                  height: 8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
            horizontalMargin24
          ],
          children: [
            AppTitleViewAll(
              title: AppStrings.homeTrendingJob,
              onPressed: () => JobTrendingViewAllPage.openForJobTrendingViewAll(controller),
            ),
            Container(
              height: 220.h,
              child: _buildBody(controller),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvt(
    HomeController controller,
  ) =>
      Row(
        children: [
          horizontalMargin24,
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Icon(
              FontAwesomeIcons.solidCircleUser,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        ],
      );

  Widget _buildBody(
    HomeController controller,
  ) =>
      Obx(
        () => ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: controller.listJobModel.value?.length ?? 0,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final data = controller.listJobModel.value![index];
            return GestureDetector(
              onTap: () => controller.navToJobDetail(data.id),
              child: _buildCardItem(
                data,
              ),
            );
          },
        ),
      );

  Widget _buildCardItem(
    JobHomeModel data,
  ) =>
      SizedBox(
        width: 320.w,
        height: 220.h,
        child: Card(
          color: Palettes.textWhite,
          surfaceTintColor: Palettes.textWhite,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          margin: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AppCachedNetworkImage(
                      imageUrl: data.imageUrl,
                      width: 80.w,
                    ),
                    horizontalMargin12,
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
                        ],
                      ),
                    ),
                  ],
                ),
                verticalMargin8,
                Text(
                  data.description,
                  style: TextStyles.defaultStyle.smallText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalMargin8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                verticalMargin8,
                Text(
                  '${data.date} - ${data.status}',
                  style: TextStyles.defaultStyle.smallText.greyText,
                ),
              ],
            ),
          ),
        ),
      );
}
