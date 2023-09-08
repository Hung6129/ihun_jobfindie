import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/authenticate/widgets/app_txtfield.dart';
import 'package:ihun_jobfindie/shared/services/helpers/authenticate_helper.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';
import 'package:ihun_jobfindie/shared/widgets/app_btn_lbl_icon.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          AppAsset.bg1,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                signInGreeting,
                style: TextStyles.customStyle
                    .setTextSize(35)
                    .setFontWeight(FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              verticalMargin24,
              AppTextFeild(
                controller: emailController,
                lblText: signInEmailHint,
                iconData: Icons.email,
                onChange: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextFeild(
                controller: passwordController,
                txtfType: 'password',
                lblText: signInPasswordHint,
                iconData: Icons.password_rounded,
                onChange: (value) {},
                keyboardType: TextInputType.visiblePassword,
              ),
              AppBtnLabelWithIcon(
                label: signInTitle,
                labelColor: Palettes.textWhite,
                bgColor: Palettes.p2,
                iconData: Icons.login,
                iconColor: Palettes.textWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () async {
                  await AuthenticateHelper().signIn(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
              verticalMargin12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    signInDontHaveAccount,
                    style: TextStyles.defaultStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: Text(signUpTitle,
                        style: TextStyles.defaultStyle.underLine.bold),
                  ),
                ],
              ),
              verticalMargin24,
              const Padding(
                padding: horizontalPadding24,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: horizontalPadding12,
                      child: Text(orSignInWith),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              verticalMargin16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Palettes.textWhite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: borderRadius64,
                        side: BorderSide(
                          color: Palettes.textBlack,
                          width: 0.2,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(AppAsset.google, width: 28.w),
                  ),
                  horizontalMargin12,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Palettes.textWhite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: borderRadius64,
                        side: BorderSide(
                          color: Palettes.textBlack,
                          width: 0.2,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(AppAsset.call2, width: 28.w),
                  ),
                  // horizontalMargin12,
                  // TextButton(
                  //   onPressed: () => throw Exception(),
                  //   child: const Text("Throw Test Exception"),
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
