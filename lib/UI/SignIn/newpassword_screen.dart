import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/SignIn/signin_screen.dart';
import 'package:onlinepayment/res.dart';

import '../../Constant/color.dart';
import '../../Controller/newpassword_controller.dart';
import '../Bottom/bottom_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key, this.isforget = false});
  bool isforget = false;
  NewPasswordController newPasswordController = Get.put(NewPasswordController());

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
              TextModel(text: 'Create New Password', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 12.h),
              TextModel(
                  text: 'Please, enter a new password below\ndifferent from the previous password',
                  color: grey,
                  fontFamily: 'R',
                  fontSize: 16.sp),
              SizedBox(height: 32.h),
              Obx(() {
                return TextFieldModel(
                  hint: 'Input Password',
                  controller: newPasswordController.password,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: newPasswordController.showPassword.value,
                  maxLine: 1,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: InkWell(
                        onTap: () {
                          newPasswordController.showPassword.value = !newPasswordController.showPassword.value;
                        },
                        child: SvgPicture.asset(newPasswordController.showPassword.value ? R.passwordhide : R.eye, color: blue)),
                  ),
                );
              }),
              SizedBox(height: 16.h),
              Obx(() {
                return TextFieldModel(
                  hint: 'Confirm Password',
                  controller: newPasswordController.conpassword,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: newPasswordController.showConPassword.value,
                  maxLine: 1,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: InkWell(
                        onTap: () {
                          newPasswordController.showConPassword.value = !newPasswordController.showConPassword.value;
                        },
                        child: SvgPicture.asset(newPasswordController.showConPassword.value ? R.passwordhide : R.eye, color: blue)),
                  ),
                );
              }),
              SizedBox(height: 330.h),
              ButtonWidget(
                title: 'Create new password',
                titleColor: white,
                onTap: () {
                  if (isforget == true) {
                    Get.off(() => BottomScreen());
                  } else {
                    Get.off(() => SignInScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
