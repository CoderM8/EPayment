import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/UI/Profile/email_screen.dart';

import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';
import '../../Constant/text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController recovery = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextModel(text: 'Forget Passsword', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 12.h),
              TextModel(
                  text: 'Enter your email and get the password in your email',
                  fontFamily: 'R',
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                  color: grey),
              SizedBox(height: 32.h),
              TextFieldModel(hint: 'Email', controller: recovery, textInputType: TextInputType.text),
              SizedBox(height: 82.h),
              ButtonWidget(
                title: 'Send me email',
                titleColor: white,
                onTap: () {
                  Get.to(() => EmailScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
