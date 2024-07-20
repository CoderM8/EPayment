import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/Card/createcard_screen.dart';
import 'package:onlinepayment/res.dart';

class CardStyleScreen extends StatelessWidget {
  const CardStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        leadingWidth: 70.w,
        title: TextModel(text: 'Choose your style', fontFamily: 'B', fontSize: 20.sp, color: black),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 20.h),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => CreateCardScreen());
                },
                child: SvgPicture.asset(R.card1)),
            SizedBox(height: 16.h),
            InkWell(
                onTap: () {
                  Get.to(() => CreateCardScreen());
                },
                child: SvgPicture.asset(R.card2)),
            SizedBox(height: 16.h),
            InkWell(
                onTap: () {
                  Get.to(() => CreateCardScreen());
                },
                child: SvgPicture.asset(R.card3)),
          ],
        ),
      ),
    );
  }
}
