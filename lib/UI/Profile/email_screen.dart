import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';
import '../../Constant/text_widget.dart';
import '../../res.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});

  final TextEditingController recovery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(R.email),
            TextModel(
                text: 'Please check in your email and get the password!',
                fontFamily: 'R',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
                color: grey),
            Spacer(),
            ButtonWidget(
              title: 'Done',
              titleColor: white,
              onTap: () {
                Get.back();
                Get.back();
                Get.back();
                // Get.offAll(() => BottomScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
