import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

class GeneralScreen extends StatelessWidget {
  GeneralScreen({super.key});

  RxBool onoff1 = false.obs;
  RxBool onoff2 = false.obs;
  RxBool onoff3 = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'General Setting',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                leading: Container(
                    height: 48.w,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: lightgrey.withOpacity(1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(R.notificationicon),
                    )),
                title: TextModel(
                  text: 'Default Notification Actions',
                  fontFamily: 'B',
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                ),
                trailing: SvgPicture.asset(R.right_arrow)),
            SizedBox(height: 10.h),
            ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                leading: Container(
                    height: 48.w,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: lightgrey.withOpacity(1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(R.setting),
                    )),
                title: TextModel(
                  text: 'Manage Notifications',
                  fontFamily: 'B',
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                ),
                trailing: SvgPicture.asset(R.right_arrow)),
            SizedBox(height: 20.h),
            Divider(
              color: grey.withOpacity(0.2),
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextModel(
                          text: 'Default Notification Actions',
                          fontSize: 14.sp,
                          fontFamily: 'M',
                          textAlign: TextAlign.start,
                        ),
                        TextModel(
                          text: 'You want to receive bill\nreminders before a bill is due.',
                          fontSize: 12.sp,
                          color: grey,
                          textAlign: TextAlign.start,
                          fontFamily: 'R',
                        ),
                      ],
                    ),
                    Obx(() {
                      return CupertinoSwitch(
                          value: onoff1.value,
                          activeColor: green,
                          thumbColor: white,
                          onChanged: (val) async {
                            onoff1.value = val;
                          });
                    }),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextModel(
                          text: 'Bills Calendar',
                          fontSize: 14.sp,
                          fontFamily: 'M',
                          textAlign: TextAlign.start,
                        ),
                        TextModel(
                          text: 'You want to receive bill\nreminder emails before a bill...',
                          fontSize: 12.sp,
                          color: grey,
                          textAlign: TextAlign.start,
                          fontFamily: 'R',
                        ),
                      ],
                    ),
                    Obx(() {
                      return CupertinoSwitch(
                          value: onoff2.value,
                          activeColor: green,
                          thumbColor: white,
                          onChanged: (val) async {
                            onoff2.value = val;
                          });
                    }),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextModel(
                          text: 'Credit Score Calendar',
                          fontSize: 14.sp,
                          fontFamily: 'M',
                          textAlign: TextAlign.start,
                        ),
                        TextModel(
                          text: 'You want to sync credit score\nreminders tou your device cale...',
                          fontSize: 12.sp,
                          color: grey,
                          textAlign: TextAlign.start,
                          fontFamily: 'R',
                        ),
                      ],
                    ),
                    Obx(() {
                      return CupertinoSwitch(
                          value: onoff3.value,
                          activeColor: green,
                          thumbColor: white,
                          onChanged: (val) async {
                            onoff3.value = val;
                          });
                    }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
