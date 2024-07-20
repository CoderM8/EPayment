import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import '../../Constant/color.dart';
import '../../res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () async {
    //   Get.offAll(() => OnBoardingScreen());
    // });
    return Scaffold(
      backgroundColor: green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(R.logo, height: 94.h, width: 94.w),
            SizedBox(height: 6.h),
            TextModel(
              text: 'E. Payment',
              fontFamily: 'B',
              fontSize: 32.sp,
            ),
          ],
        ),
      ),
    );
  }
}
