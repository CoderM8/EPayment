// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Constant/text_widget.dart';
import '../../constant/color.dart';
import '../../res.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(R.noInternet, height: 250.w, width: 250.w),
              SizedBox(height: 30.h),
              TextModel(
                text: 'NO INTERNET !!',
                fontFamily: 'B',
                color: black,
                fontSize: 18.sp,
              ),
              SizedBox(height: 10.h),
              TextModel(text: 'You Must Be Connected To The Internet To Complete This Action', fontFamily: 'M', fontSize: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}
