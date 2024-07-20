import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

import '../Bottom/bottom_screen.dart';
import 'forgetpassword_screen.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController oldpassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  final RxBool showPassword = true.obs;
  final RxBool showConPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              TextModel(text: 'Change Password', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 12.h),
              TextModel(
                  text: 'Please, enter a new password below\ndifferent from the previous password',
                  color: grey,
                  fontFamily: 'R',
                  fontSize: 16.sp),
              SizedBox(height: 32.h),
              TextFieldModel(
                hint: 'Old Password',
                controller: oldpassword,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                maxLine: 1,
              ),
              SizedBox(height: 16.h),
              Obx(() {
                return TextFieldModel(
                  hint: 'Input Password',
                  controller: password,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: showPassword.value,
                  maxLine: 1,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: InkWell(
                        onTap: () {
                          showPassword.value = !showPassword.value;
                        },
                        child: SvgPicture.asset(showPassword.value ? R.passwordhide : R.eye, color: blue)),
                  ),
                );
              }),
              SizedBox(height: 16.h),
              Obx(() {
                return TextFieldModel(
                  hint: 'Confirm Password',
                  controller: conpassword,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: showConPassword.value,
                  maxLine: 1,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: InkWell(
                        onTap: () {
                          showConPassword.value = !showConPassword.value;
                        },
                        child: SvgPicture.asset(showConPassword.value ? R.passwordhide : R.eye, color: blue)),
                  ),
                );
              }),
              SizedBox(height: 10.h),
              InkWell(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: TextModel(text: 'Forgot Password?', fontFamily: 'B', fontSize: 16.sp, color: green)),
              SizedBox(height: 240.h),
              ButtonWidget(
                title: 'Change password',
                titleColor: white,
                onTap: () {
                  Get.off(() => BottomScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
