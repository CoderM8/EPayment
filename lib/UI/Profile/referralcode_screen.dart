import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/constant.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';
import 'package:vocsy_esys_flutter_share/vocsy_esys_flutter_share.dart';

import '../../Constant/color.dart';

class ReferralCodeScreen extends StatelessWidget {
  ReferralCodeScreen({super.key});

  final String code = 'LIK5896O';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(iconColor: black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset(R.referralcode)),
              SizedBox(height: 30.h),
              RichText(
                text: TextSpan(text: 'Here’s \$20', style: TextStyle(color: blue, fontFamily: 'B', fontSize: 24.sp), children: [
                  TextSpan(text: ' free ', style: TextStyle(color: black, fontFamily: 'B', fontSize: 24.sp)),
                  TextSpan(text: 'on us!', style: TextStyle(color: blue, fontFamily: 'B', fontSize: 24.sp))
                ]),
              ),
              SizedBox(height: 8.h),
              TextModel(
                text: 'Share you referral link and earn\n\$20',
                fontSize: 16.sp,
                color: grey,
                textAlign: TextAlign.center,
                fontFamily: 'R',
              ),
              SizedBox(height: 28.h),
              Container(
                height: 56.h,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: grey.withOpacity(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          FlutterClipboard.copy(code).then((value) => showToast(message: 'Copied'));
                        },
                        child: SvgPicture.asset(R.copy)),
                    TextModel(
                      text: code,
                      fontFamily: 'R',
                      fontSize: 16.sp,
                      color: grey,
                      textAlign: TextAlign.start,
                    ),
                    InkWell(
                      onTap: () {
                        VocsyShare.text('E-Payment', code, 'text/plain');
                      },
                      child: TextModel(
                        text: 'Share',
                        fontFamily: 'B',
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Divider(
                color: grey.withOpacity(0.2),
              ),
              SizedBox(height: 50.h),
              RichText(
                text: TextSpan(text: 'Get \$3', style: TextStyle(color: blue, fontFamily: 'B', fontSize: 24.sp), children: [
                  TextSpan(text: ' free ', style: TextStyle(color: black, fontFamily: 'B', fontSize: 24.sp)),
                ]),
              ),
              SizedBox(height: 8.h),
              TextModel(
                text: 'For any account you connects',
                fontSize: 16.sp,
                color: grey,
                textAlign: TextAlign.center,
                fontFamily: 'R',
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      titleColor: white,
                      buttonColor: white,
                      isBorder: true,
                      icon: SvgPicture.asset(R.google),
                      onTap: () {
                        // Get.offAll(() => SignInScreen());
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ButtonWidget(
                      titleColor: white,
                      buttonColor: white,
                      isBorder: true,
                      icon: SvgPicture.asset(R.apple),
                      onTap: () {
                        // Get.offAll(() => SignInScreen());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
