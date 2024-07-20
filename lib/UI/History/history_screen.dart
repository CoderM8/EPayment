import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/history_controller.dart';
import 'package:onlinepayment/UI/History/historytransaction_screen.dart';
import 'package:onlinepayment/res.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.asset(
                R.patterngreen,
                fit: BoxFit.cover,
                height: 245.h,
                width: MediaQuery.sizeOf(context).width,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 54.h, 20.w, 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40.w,
                        width: 40.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), border: Border.all(width: 1.w, color: white)),
                        child: SvgPicture.asset(
                          R.arrow_left,
                          color: white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextModel(
                              text: 'Current balance',
                              fontSize: 14.sp,
                              fontFamily: 'M',
                              textAlign: TextAlign.start,
                              color: white,
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Obx(() {
                                  return TextModel(
                                    text: '\$${historyController.showBal.value ? '12,256.00' : '••••••••'}',
                                    fontSize: 32.sp,
                                    fontFamily: 'B',
                                    color: white,
                                  );
                                }),
                                SizedBox(width: 16.w),
                                Obx(() {
                                  return InkWell(
                                    onTap: () {
                                      historyController.showBal.value = !historyController.showBal.value;
                                    },
                                    child: SvgPicture.asset(historyController.showBal.value ? R.eye : R.passwordhide, color: white),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 48.w,
                          width: 48.w,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                          child: SvgPicture.asset(
                            R.refresh,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    TextModel(
                      text: 'Bank account : 2564  8546  8421  1121',
                      fontSize: 12.sp,
                      fontFamily: 'M',
                      textAlign: TextAlign.start,
                      color: white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Obx(() {
              return historyController.isSearch.value == true
                  ? TextFieldModel(
                      hint: 'Search',
                      svgUrl: R.search,
                      controller: historyController.search,
                      textInputType: TextInputType.text,
                      suffixIcon: InkWell(
                          onTap: () {
                            historyController.isSearch.value = false;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                              R.close,
                              height: 18.w,
                              width: 18.w,
                              color: black,
                            ),
                          )),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextModel(
                          text: 'Transaction history',
                          fontSize: 20.sp,
                          fontFamily: 'B',
                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                            onTap: () {
                              historyController.isSearch.value = true;
                            },
                            child: SvgPicture.asset(R.search)),
                      ],
                    );
            }),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextModel(
                          text: 'Today, Mar 20',
                          fontSize: 14.sp,
                          fontFamily: 'B',
                          textAlign: TextAlign.start,
                          color: grey,
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: historyController.transcationList.length,
                            separatorBuilder: (index, context) {
                              return Divider(color: lightgrey.withOpacity(1));
                            },
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Get.to(() => HistoryTransactionScreen());
                                },
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
                                      child: SvgPicture.asset(historyController.transcationList[index].imgUrl),
                                    )),
                                title: TextModel(
                                  text: historyController.transcationList[index].title,
                                  fontFamily: 'B',
                                  fontSize: 14.sp,
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: TextModel(
                                  text: historyController.transcationList[index].subTitle,
                                  fontFamily: 'M',
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.start,
                                  color: grey,
                                ),
                                trailing: TextModel(
                                  text: historyController.transcationList[index].price,
                                  fontFamily: 'B',
                                  fontSize: 14.sp,
                                  color: historyController.transcationList[index].price.contains('+') ? black : blue,
                                  textAlign: TextAlign.start,
                                ),
                              );
                            }),
                        SizedBox(height: 24.h),
                        TextModel(
                          text: 'Yesterday, Dec 28',
                          fontSize: 14.sp,
                          fontFamily: 'B',
                          textAlign: TextAlign.start,
                          color: grey,
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: historyController.transcationList2.length,
                            separatorBuilder: (index, context) {
                              return Divider(color: lightgrey.withOpacity(1));
                            },
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Get.to(() => HistoryTransactionScreen());
                                },
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
                                      child: SvgPicture.asset(historyController.transcationList2[index].imgUrl),
                                    )),
                                title: TextModel(
                                  text: historyController.transcationList2[index].title,
                                  fontFamily: 'B',
                                  fontSize: 14.sp,
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: TextModel(
                                  text: historyController.transcationList2[index].subTitle,
                                  fontFamily: 'M',
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.start,
                                  color: grey,
                                ),
                                trailing: TextModel(
                                  text: historyController.transcationList2[index].price,
                                  fontFamily: 'B',
                                  fontSize: 14.sp,
                                  color: historyController.transcationList2[index].price.contains('+') ? black : blue,
                                  textAlign: TextAlign.start,
                                ),
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
