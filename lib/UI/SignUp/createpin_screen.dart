import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/UI/SignUp/verifyidentity_screen.dart';
import 'package:pinput/pinput.dart';
import '../../Constant/color.dart';
import '../../Constant/text_widget.dart';

class CreatePinScreen extends StatelessWidget {
  CreatePinScreen({super.key});

  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(text: 'Set your PIN code', fontFamily: 'B', fontSize: 24.sp, textAlign: TextAlign.start),
            SizedBox(height: 12.h),
            TextModel(
                text: 'We use state-of-the-art security measures\nto protect your information at all times',
                fontFamily: 'R',
                fontSize: 16.sp,
                color: grey,
                textAlign: TextAlign.start),
            SizedBox(height: 32.h),
            Pinput(
              controller: otp,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 5,
              obscureText: true,
              autofocus: true,
              focusNode: FocusNode(canRequestFocus: true),
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
                decoration: BoxDecoration(border: Border.all(width: 2.w, color: Colors.red)),
              ),
              focusedPinTheme: PinTheme(
                height: 56.h,
                width: 56.w,
                textStyle: TextStyle(fontFamily: "B", fontSize: 24.sp, color: blue),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2.w, color: green))),
              ),
              defaultPinTheme: PinTheme(
                height: 56.h,
                width: 56.w,
                textStyle: TextStyle(fontFamily: "R", fontSize: 24.sp, color: blue),
                decoration: BoxDecoration(
                  // color: const Color(0xffF0F1F4),
                  border: Border(bottom: BorderSide(width: 2.w, color: green)),
                ),
              ),
            ),
            SizedBox(height: 125.h),
            ButtonWidget(
              title: 'Create PIN',
              titleColor: white,
              onTap: () {
                FocusManager.instance.primaryFocus!.unfocus();
                Get.to(() => VerifyIdentityScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
