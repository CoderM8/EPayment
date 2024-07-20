import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/Card/cardstyles_screen.dart';
import 'package:onlinepayment/res.dart';

class CardOnboardingScreen extends StatelessWidget {
  const CardOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(R.cardimage)),
              SizedBox(height: 48.h),
              TextModel(text: 'Create your\nSmartpay Card', fontFamily: 'B', fontSize: 32.sp, textAlign: TextAlign.start),
              SizedBox(height: 16.h),
              TextModel(
                  text: 'The customizab le, no hidden fee, instant\ndiscount debit or credit card',
                  fontFamily: 'R',
                  fontSize: 16.sp,
                  color: grey,
                  textAlign: TextAlign.start),
              SizedBox(height: 50.h),
              ButtonWidget(
                  titleColor: white,
                  title: 'Get Free Card',
                  onTap: () {
                    Get.to(() => CardStyleScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
