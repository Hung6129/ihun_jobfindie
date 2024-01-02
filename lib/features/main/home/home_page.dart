import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/features/main/home/home_controller.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_cached_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      init: HomeController(Get.find(), Get.find()),
      builder: (controller) => Scaffold(
        backgroundColor: Palettes.textWhite,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Badge(
                    child: Icon(
                      FontAwesome.bell,
                      color: Colors.white,
                    ),
                  ),
                ),
                horizontalMargin24
              ],
              backgroundColor: Palettes.textWhite,
              expandedHeight: 100.h,
              toolbarHeight: 100.h,
              pinned: true,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                    child: Obx(() => AppCachedNetworkImage(
                          imageUrl: controller.avatar.value,
                          width: 60.w,
                          height: 60.h,
                        )),
                  ),
                  horizontalMargin12,
                  Obx(
                    () => Text(
                      'Hi, ${controller.name.value}',
                      style: TextStyles.defaultStyle.appBarTitle.whiteText,
                    ),
                  )
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Palettes.p2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Row(
                      children: [
                        Text('Popular Job', style: TextStyles.defaultStyle.appBarTitle),
                        Spacer(),
                        Text('See All', style: TextStyles.defaultStyle.smallText.underLine),
                      ],
                    ),
                  ),
                  Obx(
                    () => controller.listJobModel.value?.length == 0
                        ? Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
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
                                                  Icon(
                                                    FontAwesome.money,
                                                    color: Palettes.p2,
                                                    size: 16.sp,
                                                  ),
                                                  horizontalMargin4,
                                                  Text(data.salary.toString(),
                                                      style: TextStyles.defaultStyle.smallText),
                                                  horizontalMargin12,
                                                  Icon(
                                                    FontAwesome.suitcase,
                                                    color: Palettes.p2,
                                                    size: 16.sp,
                                                  ),
                                                  horizontalMargin4,
                                                  Text(data.modality, style: TextStyles.defaultStyle.smallText),
                                                  horizontalMargin12,
                                                  Icon(
                                                    FontAwesome.clock_o,
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
            )
          ],
        ),
      ),
    );
  }
}
