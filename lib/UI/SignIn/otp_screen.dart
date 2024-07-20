import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

import '../../Constant/button_widget.dart';
import 'fingerprint_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.email});

  String email;

  OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              TextModel(text: 'Verify it’s you', fontFamily: 'B', fontSize: 24.sp),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                    text: 'We send a code to',
                    style: TextStyle(color: grey, fontFamily: 'R', fontSize: 16.sp),
                    children: [TextSpan(text: '( $email ).', style: TextStyle(color: blue, fontFamily: 'R', fontSize: 16.sp))]),
              ),
              TextModel(text: 'Enter it here to verify your identity', fontFamily: 'R', fontSize: 16.sp, color: grey),
              SizedBox(height: 32.h),
              Pinput(
                controller: otpController.otp,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                length: 5,
                autofocus: true,
                focusNode: FocusNode(canRequestFocus: false),
                onChanged: (v) {
                  // _resetPasswordController.isOtpValid.value = v.length >= 4;
                },
                errorTextStyle: TextStyle(fontFamily: "DMSans-Medium", fontSize: 14.sp, color: Colors.red),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Invalid code !!";
                //   } else {
                //     return null;
                //   }
                // },
                errorPinTheme: PinTheme(
                  height: 56.h,
                  width: 56.w,
                  textStyle: TextStyle(fontFamily: "B", fontSize: 24.sp),
                  decoration: BoxDecoration(
                      color: const Color(0xffF0F1F4),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      border: Border.all(width: 1.w, color: Colors.red)),
                ),
                focusedPinTheme: PinTheme(
                  height: 56.h,
                  width: 56.w,
                  textStyle: TextStyle(fontFamily: "B", fontSize: 24.sp, color: blue),
                  decoration: BoxDecoration(
                      color: const Color(0xffF0F1F4),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      border: Border.all(width: 1.w, color: black)),
                ),
                defaultPinTheme: PinTheme(
                  height: 56.h,
                  width: 56.w,
                  textStyle: TextStyle(fontFamily: "R", fontSize: 24.sp, color: blue),
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F1F4),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Center(child: TextModel(text: 'Resend Code', fontFamily: 'B', fontSize: 16.sp, color: green)),
              SizedBox(height: 67.h),
              ButtonWidget(
                title: 'Confirm',
                titleColor: white,
                onTap: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  Get.to(() => FingerPrintScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
