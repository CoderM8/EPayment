import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Controller/signup_controller.dart';
import 'package:onlinepayment/res.dart';
import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';
import '../../Constant/text_widget.dart';
import 'country_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
              text: TextSpan(text: 'Create a', style: TextStyle(color: blue, fontFamily: 'B', fontSize: 24.sp), children: [
                TextSpan(text: ' E. Payment ', style: TextStyle(color: green, fontFamily: 'B', fontSize: 24.sp)),
              ]),
            ),
            TextModel(
              text: 'account',
              fontFamily: 'B',
              fontSize: 24.sp,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32.h),
            TextFieldModel(hint: 'Full Name', controller: signUpController.name, textInputType: TextInputType.text),
            SizedBox(height: 16.h),
            TextFieldModel(hint: 'Email', controller: signUpController.email, textInputType: TextInputType.text),
            SizedBox(height: 16.h),
            Obx(() {
              return TextFieldModel(
                hint: 'Password',
                controller: signUpController.password,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: signUpController.showPassword.value,
                maxLine: 1,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: InkWell(
                      onTap: () {
                        signUpController.showPassword.value = !signUpController.showPassword.value;
                      },
                      child: SvgPicture.asset(signUpController.showPassword.value ? R.passwordhide : R.eye, color: blue)),
                ),
              );
            }),
            SizedBox(height: 24.h),
            ButtonWidget(
              title: 'Sign Up',
              titleColor: white,
              onTap: () {
                Get.to(() => CountryScreen());
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
            SizedBox(height: 110.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextModel(text: 'Already have an account?', fontFamily: 'R', fontSize: 16.sp, color: grey),
                SizedBox(width: 3.w),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: TextModel(text: 'Sign In', fontFamily: 'B', fontSize: 16.sp, color: green)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
