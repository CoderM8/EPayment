import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

import 'newpassword_screen.dart';

class VerifymailScreen extends StatelessWidget {
  VerifymailScreen({super.key, required this.email});

  String email;

  @override
  Widget build(BuildContext context) {
    String hideEmail(String email) {
      List<String> parts = email.split('@');
      if (parts.length != 2) {
        return email;
      }
      String username = parts[0];
      String domain = parts[1];
      if (username.length < 2) {
        return email;
      }
      String hiddenUsername = username[0] + '*' * (username.length - 1);
      return "$hiddenUsername@$domain";
    }

    String hiddenEmail = hideEmail(email);

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
              SvgPicture.asset(R.identity),
              SizedBox(height: 24.h),
              TextModel(text: 'Verify your identity', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 12.h),
              RichText(
                text: TextSpan(text: 'Where would you like', style: TextStyle(color: grey, fontFamily: 'R', fontSize: 16.sp), children: [
                  TextSpan(text: ' E. Payment ', style: TextStyle(color: blue, fontFamily: 'B', fontSize: 16.sp)),
                  TextSpan(text: 'to send', style: TextStyle(color: grey, fontFamily: 'R', fontSize: 16.sp))
                ]),
              ),
              TextModel(text: 'your security code?', fontFamily: 'R', fontSize: 16.sp, color: grey),
              SizedBox(height: 32.h),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                tileColor: lightgrey.withOpacity(1),
                leading: SvgPicture.asset(R.check),
                title: TextModel(
                  text: 'Email',
                  fontFamily: 'B',
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                ),
                subtitle: TextModel(
                  text: email.isEmpty ? 'y********@gmail.com' : hiddenEmail,
                  fontFamily: 'M',
                  fontSize: 12.sp,
                  textAlign: TextAlign.start,
                  color: grey,
                ),
                trailing: SvgPicture.asset(R.mail),
              ),
              SizedBox(
                height: 315.h,
              ),
              ButtonWidget(
                title: 'Continue',
                titleColor: white,
                onTap: () {
                  Get.to(() => NewPasswordScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
