import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';

import '../controller/update_profile_controller.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      init: UpdateProfileController(
        Get.find(),
      ),
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Update Profile'),
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () => Get.back(),
              ),
            ),
            body: SingleChildScrollView(
              child: _buildUpdateForm(controller),
            ),
            bottomNavigationBar: _buildBottomButton(controller),
          ),
        );
      },
    );
  }

  Widget _buildUpdateForm(
    UpdateProfileController controller,
  ) {
    return FormBuilder(
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
  }

  Widget _buildBottomButton(UpdateProfileController controller) {
    return Container(
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
  }
}
