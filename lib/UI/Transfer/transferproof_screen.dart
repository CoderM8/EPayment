import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/transfersend_controller.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class TransferProofScreen extends StatelessWidget {
  TransferProofScreen({super.key});

  TransferSendController transferSendController = Get.put(TransferSendController());

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
            Center(child: SvgPicture.asset(R.transfersuccess)),
            SizedBox(height: 45.h),
            TextModel(
              text: 'Transfer Successful',
              fontFamily: 'B',
              fontSize: 24.sp,
            ),
            SizedBox(height: 12.h),
            TextModel(
              text: 'Transfers are reviewed which may result in\ndelays or funds being frozen',
              fontFamily: 'R',
              fontSize: 11.sp,
              color: grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            Container(
              height: 74.h,
              width: 168.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: grey.withOpacity(0.1)),
              child: Center(
                child: TextModel(
                  text: '\$${transferSendController.price.text.isEmpty ? '0000' : transferSendController.price.text}',
                  fontFamily: 'B',
                  fontSize: 32.sp,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            ButtonWidget(
                titleColor: white,
                title: 'Back to Home',
                onTap: () {
                  Get.to(() => BottomScreen());
                }),
          ],
        ),
      ),
    );
  }
}
