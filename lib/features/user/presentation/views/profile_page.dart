import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import '../../../../shared/widgets/app_cached_image_widget.dart';
import '../controller/user_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder(
        init: UserController(Get.find(), Get.find()),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              'My Profile',
              style: TextStyles.defaultStyle.largeText,
            ),
            actions: [
              IconButton(
                onPressed: () => controller.signOut(),
                icon: Icon(
                  FontAwesomeIcons.rightFromBracket,
                  size: 20.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  // controller.navigateToEditProfile();
                },
                icon: Icon(
                  FontAwesomeIcons.penToSquare,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          body: Obx(
            () => SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  // User avatar
                  _buildAvt(controller),
                  _buildUploadResumeFileButton(controller),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  // List of user skill
                  ListTile(
                    title: Text('Skills'),
                    subtitle: Text(controller.profileModel.value?.skill ?? '- -'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  _buildJobsApplied(controller),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildJobsApplied(UserController controller) => ListTile(
        title: Text(
          'Jobs Applied',
          style: TextStyles.defaultStyle.largeText,
        ),
        subtitle: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listJobModel.value?.length ?? 0,
            itemBuilder: (context, index) {
              final job = controller.listJobModel.value![index];
              return ListTile(
                onTap: () {},
                title: Text(
                  job.title,
                  style: TextStyles.defaultStyle.mediumText,
                ),
                subtitle: Text('${job.date}'),
              );
            },
          ),
        ),
      );

  Widget _buildAvt(UserController controller) => Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 70.h,
            child: Row(
              children: [
                AppCachedNetworkImage(
                  imageUrl: controller.profileModel.value?.avatar ?? '',
                  width: 60.w,
                  height: 60.h,
                ),
                horizontalMargin12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.profileModel.value?.username ?? '- -',
                        style: TextStyles.defaultStyle.mediumText,
                      ),
                      Text(
                        'Email: ${controller.profileModel.value?.email ?? '- -'}',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildUploadResumeFileButton(
    UserController controller,
  ) =>
      GestureDetector(
        onTap: () => controller.onPickFile(),
        child: DottedBorder(
          borderType: BorderType.Rect,
          child: Container(
            width: 320.w,
            height: 40.h,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.fileArrowUp,
                    size: 20.sp,
                  ),
                  horizontalMargin8,
                  Text(
                    'Upload Your Resume',
                    style: TextStyles.defaultStyle.smallText.bold,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
