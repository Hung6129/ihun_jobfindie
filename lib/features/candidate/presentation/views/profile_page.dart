import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import '../../../../configuration/constants/app_spacing.dart';
import '../../../../shared/widgets/app_cached_image_widget.dart';
import '../controller/candidate_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder(
        init: CandidateController(Get.find(), Get.find()),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('My Profile'),
            actions: [
              IconButton(
                onPressed: () => controller.signOut(),
                icon: Icon(Icons.logout),
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
                  _buildJobsByAgnetId(controller),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildJobsByAgnetId(CandidateController controller) => !controller.isAgent.value
      ? const SizedBox.shrink()
      : ListTile(
          title: Text(
            'Jobs you posted',
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
                  subtitle: Text('You posted: ${job.date}'),
                );
              },
            ),
          ),
        );

  Widget _buildAvt(CandidateController controller) => Obx(
        () => Row(
          children: [
            horizontalMargin12,
            AppCachedNetworkImage(
              imageUrl: controller.profileModel.value?.avatar ?? '',
              width: 60.w,
              height: 60.h,
            ),
            horizontalMargin12,
            Expanded(
              child: ListTile(
                title: Text(controller.profileModel.value?.username ?? '- -'),
                subtitle: Text(controller.profileModel.value?.email ?? '- -'),
              ),
            ),
          ],
        ),
      );
}
