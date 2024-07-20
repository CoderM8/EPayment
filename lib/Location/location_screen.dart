import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Location/findatm_screen.dart';
import 'package:onlinepayment/res.dart';

import '../Constant/color.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(R.locationimage)),
            SizedBox(height: 30.h),
            TextModel(
              text: 'Find Location',
              fontSize: 24.sp,
              fontFamily: 'B',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            TextModel(
              text: 'To do this process please click now to find the\nlocation your nearest ATM',
              fontSize: 11.sp,
              fontFamily: 'R',
              color: grey,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ButtonWidget(
                titleColor: white,
                title: 'Find Location',
                onTap: () {
                  Get.to(() => FindATMScreen());
                }),
          ],
        ),
      ),
    );
  }
}
