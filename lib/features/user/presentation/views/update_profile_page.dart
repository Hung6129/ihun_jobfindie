import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';

import '../controller/update_profile_controller.dart';
import 'pdf_view_page.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      init: UpdateProfileController(Get.find()),
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Update Profile'),
              leading: IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: 20.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildUpdateForm(controller),
                  verticalMargin12,
                  _buildUploadResumeFileButton(context, controller),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomButton(controller),
          ),
        );
      },
    );
  }

  Widget _buildUpdateForm(
    UpdateProfileController controller,
  ) =>
      FormBuilder(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              verticalMargin12,
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              verticalMargin12,
              FormBuilderTextField(
                name: 'bio',
                decoration: const InputDecoration(
                  labelText: 'Bio',
                ),
                maxLines: 20,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              verticalMargin12,
              FormBuilderTextField(
                name: 'skills',
                decoration: const InputDecoration(labelText: 'Skills'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              verticalMargin12,
              FormBuilderTextField(
                name: 'location',
                decoration: const InputDecoration(labelText: 'Your Location'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              verticalMargin12,
              FormBuilderTextField(
                name: 'phoneNum',
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
            ],
          ),
        ),
      );

  Widget _buildBottomButton(UpdateProfileController controller) => Container(
        margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: ElevatedButton.icon(
          icon: const Icon(FontAwesomeIcons.solidFloppyDisk, color: Colors.white),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), backgroundColor: Palettes.p2),
          onPressed: () => controller.updateProfile(),
          label: Text(
            'Update Profile',
            style: TextStyles.defaultStyle.semibold.mediumText.whiteText,
          ),
        ),
      );

  Widget _buildUploadResumeFileButton(
    BuildContext context,
    UpdateProfileController controller,
  ) =>
      Obx(
        () => GestureDetector(
          onTap: () {
            if (controller.fileName.value.isEmpty && controller.fileName.value == '') {
              controller.onPickFile();
            } else {
              showBottomSheetOpts(context, controller);
            }
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            color: controller.fileName.value == "" ? Colors.redAccent : Colors.green,
            dashPattern: [10, 6],
            child: Container(
              width: 330.w,
              height: 60.h,
              child: !controller.isShowLoading.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          controller.fileName.value == ""
                              ? FontAwesomeIcons.fileArrowUp
                              : FontAwesomeIcons.folderOpen,
                          size: 20.sp,
                          color: controller.fileName.value == "" ? Colors.redAccent : Colors.green,
                        ),
                        horizontalMargin8,
                        Text(
                          controller.fileName.value == ""
                              ? 'Choose your resume file'
                              : '${controller.fileName.value}',
                          style: TextStyles.defaultStyle.smallText.bold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.progress.value == 1 ? 'Upload completed' : 'Uploading...',
                            style: TextStyles.defaultStyle.smallText,
                          ),
                          LinearProgressIndicator(
                            value: controller.progress.value,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(Palettes.p2),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      );

  Future showBottomSheetOpts(
    BuildContext context,
    UpdateProfileController controller,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200.h,
          padding: EdgeInsets.all(16.0),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(FontAwesomeIcons.eye),
                title: Text('View file'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    Get.context!,
                    MaterialPageRoute(
                      builder: (context) => PDFViewPage(
                        path: controller.directoryPath.value,
                        fileName: controller.fileName.value,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.penToSquare),
                title: Text('Upload new file'),
                onTap: () async {
                  Navigator.pop(context);
                  await controller.onPickFile();
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.solidTrashCan),
                title: Text('Delete file'),
                onTap: () async {
                  Navigator.pop(context);
                  await controller.onDeleteResumeFile(
                    fileName: controller.fileName.value,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
