import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

class MyQRCodeScreen extends StatelessWidget {
  const MyQRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'QR Code',
          textAlign: TextAlign.center,
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
        actions: [
          BackButtonWidget(svgUrl: R.moremenu),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                // Get.to(() => TransferMoneyScreen());
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              tileColor: lightgrey.withOpacity(1),
              leading: Image.asset(R.profilephoto),
              title: TextModel(
                text: 'Tommy Jason',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              subtitle: TextModel(
                text: '**** **** **** 1121',
                fontFamily: 'M',
                fontSize: 12.sp,
                textAlign: TextAlign.start,
                color: grey,
              ),
              trailing: SvgPicture.asset(R.arrow_down),
            ),
            SizedBox(height: 40.h),
            Container(
              height: 335.h,
              width: 305.w,
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.2),
                      spreadRadius: 10.r,
                      blurRadius: 25.0,
                      offset: const Offset(
                        7.0,
                        8.0,
                      )),
                ],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: SvgPicture.asset(R.qrcode),
            ),
            SizedBox(height: 90.h),
            SvgPicture.asset(R.alert),
            SizedBox(height: 24.h),
            TextModel(
              text: 'This is a single-use code for your use only. Get a new code each time you pay with smartpay',
              fontFamily: 'M',
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
