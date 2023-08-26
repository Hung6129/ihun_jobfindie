import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configuration/styles/palettes.dart';
import '../../../../core/widgets/app_btn_label.dart';
import '../../../authenticate/presentation/widgets/app_txtfield.dart';

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
        Image.asset(
          'assets/bg-2.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFeild(
                controller: nameController,
                lblText: 'Type in your name',
                iconData: Icons.person,
                onChange: (value) {},
              ),
              AppTextFeild(
                controller: emailController,
                lblText: 'Type in your email',
                iconData: Icons.email,
                onChange: (value) {},
              ),
              AppTextFeild(
                controller: passwordController,
                txtfType: 'password',
                lblText: 'Type in your password',
                iconData: Icons.password_rounded,
                onChange: (value) {},
              ),
              AppBtnLabel(
                label: 'Sign up',
                labelColor: Palettes.textWhite,
                bgColor: Palettes.textBlack,
                iconData: Icons.app_registration_rounded,
                iconColor: Palettes.textWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () {},
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Palettes.textBlack,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign in',
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
