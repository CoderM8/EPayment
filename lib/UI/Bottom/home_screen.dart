import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/home_controller.dart';
import 'package:onlinepayment/UI/History/history_screen.dart';
import 'package:onlinepayment/UI/Transfer/topup_screen.dart';
import 'package:onlinepayment/UI/Transfer/transfermoney_screen.dart';
import 'package:onlinepayment/UI/Transfer/withdraw_screen.dart';
import 'package:onlinepayment/res.dart';

import '../Profile/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextModel(
                text: 'Welcome back!',
                textAlign: TextAlign.start,
                color: grey,
                fontSize: 12.sp,
                fontFamily: 'R',
              ),
              SizedBox(height: 4.h),
              TextModel(
                text: 'Tommy Jason',
                textAlign: TextAlign.start,
                color: blue,
                fontSize: 20.sp,
                fontFamily: 'B',
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: Container(
              height: 48.w,
              width: 48.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: lightgrey.withOpacity(1), borderRadius: BorderRadius.circular(12.r)),
              child: SvgPicture.asset(R.notification),
            ),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 340.h,
            width: MediaQuery.sizeOf(context).width,
            color: grey.withOpacity(0.2),
            child: Row(
              children: [
                Container(
                  height: 292.h,
                  width: 86.w,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(R.deposit),
                          SizedBox(height: 8.h),
                          TextModel(
                            text: 'Deposit',
                            textAlign: TextAlign.start,
                            fontSize: 12.sp,
                            fontFamily: 'M',
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => TransferMoneyScreen());
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(R.transfers),
                            SizedBox(height: 8.h),
                            TextModel(
                              text: 'Transfers',
                              textAlign: TextAlign.start,
                              fontSize: 12.sp,
                              fontFamily: 'M',
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => WithDrawScreen());
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(R.withdraw),
                            SizedBox(height: 8.h),
                            TextModel(
                              text: 'Withdraw',
                              textAlign: TextAlign.start,
                              fontSize: 12.sp,
                              fontFamily: 'M',
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(R.more),
                            SizedBox(height: 8.h),
                            TextModel(
                              text: 'More',
                              textAlign: TextAlign.start,
                              fontSize: 12.sp,
                              fontFamily: 'M',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(() => TopupScreen());
                              },
                              child: SvgPicture.asset(R.v_card1)),
                          SizedBox(width: 24.w),
                          InkWell(
                              onTap: () {
                                Get.to(() => TopupScreen());
                              },
                              child: SvgPicture.asset(R.v_card2)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextModel(
                  text: 'Today, Mar 20',
                  textAlign: TextAlign.start,
                  color: grey,
                  fontSize: 14.sp,
                  fontFamily: 'B',
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => HistoryScreen());
                  },
                  child: TextModel(
                    text: 'All transactions >',
                    textAlign: TextAlign.start,
                    color: blue,
                    fontSize: 14.sp,
                    fontFamily: 'M',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: homeController.transcationList.length,
                  separatorBuilder: (index, context) {
                    return Divider(color: lightgrey.withOpacity(1));
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
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
                            child: SvgPicture.asset(homeController.transcationList[index].imgUrl),
                          )),
                      title: TextModel(
                        text: homeController.transcationList[index].title,
                        fontFamily: 'B',
                        fontSize: 14.sp,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: TextModel(
                        text: homeController.transcationList[index].subTitle,
                        fontFamily: 'M',
                        fontSize: 12.sp,
                        textAlign: TextAlign.start,
                        color: grey,
                      ),
                      trailing: TextModel(
                        text: homeController.transcationList[index].price,
                        fontFamily: 'B',
                        fontSize: 14.sp,
                        color: index == 1 ? green : blue,
                        textAlign: TextAlign.start,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
