import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_jobfindie/core/app_asset.dart';
import 'package:ihun_jobfindie/features/authenticate/presentation/signup/sign_up_page.dart';
import 'package:ihun_jobfindie/features/course/presentation/home/views/home_page.dart';

import '../../../../configuration/styles/palettes.dart';
import '../../../../core/widgets/app_btn_label.dart';
import '../../../authenticate/presentation/widgets/app_txtfield.dart';

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
              AppTextFeild(
                controller: emailController,
                lblText: 'Type in your email',
                iconData: Icons.email,
                onChange: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextFeild(
                controller: passwordController,
                txtfType: 'password',
                lblText: 'Type in your password',
                iconData: Icons.password_rounded,
                onChange: (value) {},
                keyboardType: TextInputType.visiblePassword,
              ),
              AppBtnLabel(
                label: 'Log in',
                labelColor: Palettes.textWhite,
                bgColor: Palettes.p2,
                iconData: Icons.login,
                iconColor: Palettes.textWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Palettes.textBlack,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Palettes.textBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
