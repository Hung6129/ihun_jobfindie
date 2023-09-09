import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/authenticate/widgets/app_txtfield.dart';
import 'package:ihun_jobfindie/shared/services/helpers/authenticate_helper.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_btn_lbl_icon.dart';

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
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(AppAsset.bg2,
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                signUpGreeting,
                style: TextStyles.customStyle
                    .setTextSize(35)
                    .setFontWeight(FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              verticalMargin24,
              AppTextFeild(
                controller: nameController,
                lblText: signUpNamehint,
                iconData: Icons.person,
                onChange: (value) {},
                keyboardType: TextInputType.name,
              ),
              AppTextFeild(
                controller: emailController,
                lblText: signUpEmailHint,
                iconData: Icons.email,
                onChange: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextFeild(
                controller: passwordController,
                txtfType: 'password',
                lblText: signUpPasswordHint,
                iconData: Icons.password_rounded,
                onChange: (value) {},
                keyboardType: TextInputType.visiblePassword,
              ),
              AppBtnLabelWithIcon(
                label: signUpTitle,
                labelColor: Palettes.textBlack,
                bgColor: Palettes.p4,
                iconData: Icons.app_registration_rounded,
                iconColor: Palettes.textBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () async {
                  await AuthenticateHelper().signUp(
                    context,
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(signUpAlreadyHaveAccount,
                      style: TextStyles.defaultStyle),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(signInTitle, style: TextStyles.defaultStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
