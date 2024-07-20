import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class ConfirmTopupScreen extends StatelessWidget {
  ConfirmTopupScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'Confirmation',
          fontSize: 20.sp,
          fontFamily: 'B',
          color: black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(R.card2),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextModel(
                  text: 'Top up balance',
                  fontFamily: 'M',
                  fontSize: 16.sp,
                  color: grey,
                ),
                TextModel(
                  text: '\$2,256.00',
                  fontFamily: 'B',
                  fontSize: 16.sp,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextModel(
                  text: 'Fee',
                  fontFamily: 'M',
                  fontSize: 16.sp,
                  color: grey,
                ),
                TextModel(
                  text: '\$3.0',
                  fontFamily: 'B',
                  fontSize: 16.sp,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(
              color: grey.withOpacity(0.2),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextModel(
                  text: 'Total',
                  fontFamily: 'M',
                  fontSize: 16.sp,
                  color: grey,
                ),
                TextModel(
                  text: '\$2,259.00',
                  fontFamily: 'B',
                  fontSize: 16.sp,
                ),
              ],
            ),
            Spacer(),
            ButtonWidget(
                titleColor: white,
                title: 'Confirm Top Up',
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: DraggableScrollableSheet(
                        maxChildSize: 0.7,
                        initialChildSize: 0.7,
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(R.topupsuccess),
                                SizedBox(
                                  height: 22.h,
                                ),
                                TextModel(
                                  text: 'Top Up Success',
                                  fontFamily: 'B',
                                  fontSize: 24.sp,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                TextModel(
                                  text: 'Top up are reviewed which may result in delays\nor funds being frozen',
                                  fontFamily: 'R',
                                  color: grey,
                                  fontSize: 11.sp,
                                ),
                                Spacer(),
                                ButtonWidget(
                                    titleColor: white,
                                    title: 'Back to Home',
                                    onTap: () {
                                      Get.back();
                                      Get.off(() => BottomScreen());
                                    }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
