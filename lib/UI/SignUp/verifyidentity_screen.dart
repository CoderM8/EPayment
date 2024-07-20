import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/SignUp/uploadselfie_screen.dart';
import 'package:onlinepayment/res.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({super.key});

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(text: 'Let’s verify your identity', fontFamily: 'B', fontSize: 24.sp, textAlign: TextAlign.start),
            SizedBox(width: 12.h),
            TextModel(
                text: 'We’re required by law to verify your identity\nbefore we can use your money',
                fontFamily: 'R',
                fontSize: 16.sp,
                color: grey,
                textAlign: TextAlign.start),
            SizedBox(height: 72.h),
            Center(
                child: Stack(
              children: [
                SvgPicture.asset(R.scanface),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 220.h * _controller.value), // Adjust the offset range as needed
                      child: child,
                    );
                  },
                  child: Container(
                      width: 250.w,
                      height: 100.h,
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                        green,
                        green.withOpacity(0.7),
                        green.withOpacity(0.4),
                        green.withOpacity(0.2),
                        green.withOpacity(0.1),
                        green.withOpacity(0.01),
                      ]))),
                ),
              ],
            )),
            const Spacer(),
            ButtonWidget(
              title: 'Verify Identity',
              titleColor: white,
              onTap: () {
                Get.to(() => UploadSelfieScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
