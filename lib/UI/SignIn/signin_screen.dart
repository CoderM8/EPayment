import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Controller/login_controller.dart';
import 'package:onlinepayment/UI/SignIn/passwordrecovery_screen.dart';
import 'package:onlinepayment/res.dart';

import '../../Constant/text_widget.dart';
import '../SignUp/signup_screen.dart';
import 'otp_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              TextModel(text: 'Hi There! 👋', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 8.h),
              TextModel(text: 'Welcome back, Sign in to your account', fontFamily: 'R', fontSize: 16.sp, color: grey),
              SizedBox(height: 32.h),
              TextFieldModel(hint: 'Email', controller: loginController.email, textInputType: TextInputType.text),
              SizedBox(height: 16.h),
              Obx(() {
                return TextFieldModel(
                  hint: 'Input Password',
                  controller: loginController.password,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: loginController.showPassword.value,
                  maxLine: 1,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: InkWell(
                        onTap: () {
                          loginController.showPassword.value = !loginController.showPassword.value;
                        },
                        child: SvgPicture.asset(loginController.showPassword.value ? R.passwordhide : R.eye, color: blue)),
                  ),
                );
              }),
              SizedBox(height: 24.h),
              InkWell(
                  onTap: () {
                    Get.to(() => PasswordRecoveryScreen());
                  },
                  child: TextModel(text: 'Forgot Password?', fontFamily: 'B', fontSize: 16.sp, color: green)),
              SizedBox(height: 24.h),
              ButtonWidget(
                title: 'Sign In',
                titleColor: white,
                onTap: () {
                  Get.to(() => OtpScreen(email: loginController.email.text));
                },
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: grey.withOpacity(0.2))),
                  SizedBox(width: 5.w),
                  TextModel(text: 'OR', fontFamily: 'R', fontSize: 11.sp, color: grey),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Divider(
                      color: grey.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      titleColor: white,
                      buttonColor: white,
                      isBorder: true,
                      icon: SvgPicture.asset(R.google),
                      onTap: () {
                        // Get.offAll(() => SignInScreen());
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ButtonWidget(
                      titleColor: white,
                      buttonColor: white,
                      isBorder: true,
                      icon: SvgPicture.asset(R.apple),
                      onTap: () {
                        // Get.offAll(() => SignInScreen());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextModel(text: 'Don’t have an account?', fontFamily: 'R', fontSize: 16.sp, color: grey),
                  SizedBox(width: 3.w),
                  InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: TextModel(text: 'Sign Up', fontFamily: 'B', fontSize: 16.sp, color: green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
