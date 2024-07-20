import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/Transfer/transferproof_screen.dart';
import 'package:onlinepayment/res.dart';

import '../../Controller/transfersend_controller.dart';

class TransferSendScreen extends StatelessWidget {
  TransferSendScreen({super.key});

  TransferSendController transferSendController = Get.put(TransferSendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'Send Money',
          textAlign: TextAlign.center,
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.h),
              Center(
                child: Container(
                  height: 110.h,
                  width: 110.w,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.5.w, color: black)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      R.p1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              TextModel(
                text: 'to Linda',
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                fontFamily: 'B',
              ),
              SizedBox(height: 32.h),
              Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r), border: Border.all(width: 1.w, color: grey.withOpacity(0.1))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextModel(
                            text: 'Enter amount:',
                            textAlign: TextAlign.start,
                            fontSize: 12.sp,
                            color: grey,
                            fontFamily: 'M',
                          ),
                          TextModel(
                            text: 'Max \$12,652.00',
                            textAlign: TextAlign.start,
                            fontSize: 12.sp,
                            color: grey,
                            fontFamily: 'M',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(() {
                            return Container(
                              height: 32.h,
                              width: 66.w,
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  dropdownColor: white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  value: transferSendController.currency.value.isEmpty ? null : transferSendController.currency.value,
                                  elevation: 16,
                                  onChanged: (String? newValue) {
                                    transferSendController.currency.value = newValue!;
                                  },
                                  underline: SizedBox(),
                                  items: <String>['USD', 'EUR', 'INR', 'CAD'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                          Expanded(
                            child: TextFieldModel(
                              hint: 'Enter Price',
                              color: blue,
                              fontSize: 24.sp,
                              controller: transferSendController.price,
                              textInputType: TextInputType.number,
                              hideBorder: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 33.h),
              ButtonWidget(
                  titleColor: white,
                  onTap: () {
                    Get.dialog(
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Dialog(
                              backgroundColor: Colors.transparent,
                              child: CustomPaint(
                                size: Size(410, (410 * 1.2446483180428134).toDouble()),
                                painter: RPSCustomPainter2(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 40.h),
                                      TextModel(text: 'Transfer Confirmation', fontFamily: 'B', fontSize: 20.sp),
                                      SizedBox(height: 31.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextModel(
                                            text: 'From',
                                            fontFamily: 'R',
                                            fontSize: 12.sp,
                                            color: grey,
                                          ),
                                          TextModel(
                                            text: 'Bank of America',
                                            fontFamily: 'R',
                                            fontSize: 12.sp,
                                            color: grey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextModel(
                                            text: 'Tommy',
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                          ),
                                          TextModel(
                                            text: '**** 1121',
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Divider(
                                        color: grey.withOpacity(0.2),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextModel(
                                            text: 'To',
                                            fontFamily: 'R',
                                            fontSize: 12.sp,
                                            color: grey,
                                          ),
                                          TextModel(
                                            text: 'Citibank Online',
                                            fontFamily: 'R',
                                            fontSize: 12.sp,
                                            color: grey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextModel(
                                            text: 'Linda',
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                          ),
                                          TextModel(
                                            text: '**** 8456',
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Divider(
                                        color: grey.withOpacity(0.2),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextModel(
                                            text: 'Total',
                                            fontFamily: 'M',
                                            color: grey,
                                            fontSize: 16.sp,
                                          ),
                                          TextModel(
                                            text: transferSendController.price.text.isEmpty
                                                ? '\$0000'
                                                : '\$${transferSendController.price.text}',
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 14.h),
                                      ButtonWidget(
                                          width: 287.w,
                                          titleColor: white,
                                          title: 'Ok, Send Now!',
                                          onTap: () {
                                            Get.back();
                                            Get.to(() => TransferProofScreen());
                                          }),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              )),
                          Positioned(
                              top: 145.h,
                              child: Container(
                                  height: 88.w,
                                  width: 88.w,
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(color: white, shape: BoxShape.circle),
                                  child: Container(
                                      height: 78.w,
                                      width: 78.w,
                                      decoration: BoxDecoration(color: grey.withOpacity(0.1), shape: BoxShape.circle),
                                      child: Center(child: SvgPicture.asset(R.twocard))))),
                        ],
                      ),
                    );
                  },
                  title: 'Send Money'),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3812049, size.height * 0.04503145);
    path_0.cubicTo(size.width * 0.3602691, size.height * 0.02293482, size.width * 0.3498012, size.height * 0.01188646,
        size.width * 0.3454404, size.height * 0.008995258);
    path_0.cubicTo(size.width * 0.3365474, size.height * 0.003095799, size.width * 0.3366789, size.height * 0.003148477,
        size.width * 0.3254495, size.height * 0.001035521);
    path_0.cubicTo(size.width * 0.3199450, 0, size.width * 0.3115474, 0, size.width * 0.2947554, 0);
    path_0.lineTo(size.width * 0.1100917, 0);
    path_0.cubicTo(size.width * 0.07589419, 0, size.width * 0.05879541, 0, size.width * 0.04530765, size.height * 0.004488673);
    path_0.cubicTo(size.width * 0.02732391, size.height * 0.01047359, size.width * 0.01303593, size.height * 0.02195312,
        size.width * 0.005586820, size.height * 0.03640197);
    path_0.cubicTo(0, size.height * 0.04723857, 0, size.height * 0.06097641, 0, size.height * 0.08845209);
    path_0.lineTo(0, size.height * 0.9115479);
    path_0.cubicTo(0, size.height * 0.9390246, 0, size.height * 0.9527617, size.width * 0.005586820, size.height * 0.9635971);
    path_0.cubicTo(size.width * 0.01303593, size.height * 0.9780467, size.width * 0.02732391, size.height * 0.9895258,
        size.width * 0.04530765, size.height * 0.9955111);
    path_0.cubicTo(size.width * 0.05879541, size.height, size.width * 0.07589419, size.height, size.width * 0.1100917, size.height);
    path_0.lineTo(size.width * 0.8899083, size.height);
    path_0.cubicTo(
        size.width * 0.9241070, size.height, size.width * 0.9412049, size.height, size.width * 0.9546911, size.height * 0.9955111);
    path_0.cubicTo(size.width * 0.9726758, size.height * 0.9895258, size.width * 0.9869633, size.height * 0.9780467, size.width * 0.9944128,
        size.height * 0.9635971);
    path_0.cubicTo(size.width, size.height * 0.9527617, size.width, size.height * 0.9390246, size.width, size.height * 0.9115479);
    path_0.lineTo(size.width, size.height * 0.08845209);
    path_0.cubicTo(
        size.width, size.height * 0.06097641, size.width, size.height * 0.04723857, size.width * 0.9944128, size.height * 0.03640197);
    path_0.cubicTo(size.width * 0.9869633, size.height * 0.02195312, size.width * 0.9726758, size.height * 0.01047359,
        size.width * 0.9546911, size.height * 0.004488673);
    path_0.cubicTo(size.width * 0.9412049, 0, size.width * 0.9241070, 0, size.width * 0.8899083, 0);
    path_0.lineTo(size.width * 0.7052446, 0);
    path_0.cubicTo(size.width * 0.6884526, 0, size.width * 0.6800550, 0, size.width * 0.6745505, size.height * 0.001035521);
    path_0.cubicTo(size.width * 0.6633211, size.height * 0.003148477, size.width * 0.6634526, size.height * 0.003095799,
        size.width * 0.6545596, size.height * 0.008995233);
    path_0.cubicTo(size.width * 0.6501988, size.height * 0.01188646, size.width * 0.6397309, size.height * 0.02293482,
        size.width * 0.6187951, size.height * 0.04503145);
    path_0.cubicTo(size.width * 0.5925015, size.height * 0.07278256, size.width * 0.5490948, size.height * 0.09090909,
        size.width * 0.5000000, size.height * 0.09090909);
    path_0.cubicTo(size.width * 0.4509052, size.height * 0.09090909, size.width * 0.4074985, size.height * 0.07278256,
        size.width * 0.3812049, size.height * 0.04503145);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
