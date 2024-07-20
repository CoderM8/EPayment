import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/constant.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';
import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            R.finger_bg,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BackButtonWidget(ismargin: true),
              SizedBox(height: 70.h),
              TextModel(text: 'Enable biometric Access', fontFamily: 'B', fontSize: 24.sp, color: blue),
              SizedBox(width: 12.h),
              TextModel(
                  text: 'Login quickly and securely with the\n fingerprint stored on this device',
                  fontFamily: 'R',
                  fontSize: 16.sp,
                  color: grey),
              SizedBox(height: 85.h),
              SvgPicture.asset(R.biometric, height: 137.w, width: 137.w),
              SizedBox(height: 180.h),
              ButtonWidget(
                title: 'Enable biometric access',
                titleColor: white,
                onTap: () async {
                  await localStorage.write('isRegister', true);
                  Get.offAll(() => BottomScreen());
                },
              ),
              SizedBox(height: 24.h),
              TextModel(
                text: 'I’ll do this later',
                fontFamily: 'B',
                fontSize: 16.sp,
                color: green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
