import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/UI/SignIn/verifymail_screen.dart';

import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';
import '../../Constant/text_widget.dart';
import '../../res.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  PasswordRecoveryScreen({super.key});

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
              SvgPicture.asset(R.lock),
              SizedBox(height: 24.h),
              TextModel(text: 'Passsword Recovery', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 12.h),
              TextModel(
                  text: 'Enter your registered email below to receive\npassword instructions',
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
                  Get.to(() => VerifymailScreen(email: recovery.text));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
