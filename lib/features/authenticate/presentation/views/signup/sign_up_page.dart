import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/controller/authenticate_controller.dart';

import 'package:ihun_jobfindie/shared/widgets/app_txtfield.dart';

import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/styles/palettes.dart';
import 'package:ihun_jobfindie/shared/widgets/app_texticonbtn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticateController>(
        init: AuthenticateController(Get.find()),
        builder: (controller) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                body: Stack(
              children: [
                Image.asset(AppAsset.bg2,
                    fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.signUpGreeting,
                        style: TextStyles.customStyle
                            .setTextSize(35.sp)
                            .setFontWeight(FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      verticalMargin24,
                      _buildForm(),
                      AppTextIconBtn(
                        label: AppStrings.signUpTitle,
                        labelColor: Palettes.textBlack,
                        bgColor: Palettes.p4,
                        iconData: Icons.app_registration_rounded,
                        iconColor: Palettes.textBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        onPressed: () {
                          controller.requestRegister(
                            nameController.text,
                            passwordController.text,
                            emailController.text,
                            context,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppStrings.signUpAlreadyHaveAccount,
                            style: TextStyles.defaultStyle,
                          ),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              AppStrings.signInTitle,
                              style: TextStyles.defaultStyle.underLine.bold.mediumText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          );
        });
  }

  Widget _buildForm() {
    return Column(
      children: [
        AppTextFeild(
          controller: nameController,
          lblText: AppStrings.signUpNamehint,
          iconData: FontAwesomeIcons.user,
          onChange: (value) {},
          keyboardType: TextInputType.name,
        ),
        AppTextFeild(
          controller: emailController,
          lblText: AppStrings.signUpEmailHint,
          iconData: FontAwesomeIcons.envelope,
          onChange: (value) {},
          keyboardType: TextInputType.emailAddress,
        ),
        AppTextFeild(
          controller: passwordController,
          txtfType: 'password',
          lblText: AppStrings.signUpPasswordHint,
          iconData: FontAwesomeIcons.key,
          onChange: (value) {},
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
