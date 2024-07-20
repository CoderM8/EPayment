import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/mybankcard_controller.dart';
import 'package:onlinepayment/UI/Card/editcard_screen.dart';
import 'package:onlinepayment/res.dart';

class MyBankCardScreen extends StatelessWidget {
  MyBankCardScreen({super.key});

  MyBankCardController myBankCardController = Get.put(MyBankCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'My Card',
          fontSize: 20.sp,
          fontFamily: 'B',
          color: black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.w);
                  },
                  itemCount: myBankCardController.cards.length,
                  itemBuilder: (context, index) {
                    final cards = myBankCardController.cards[index];
                    return InkWell(
                      onLongPress: () {
                        Get.dialog(Dialog(
                          backgroundColor: white,
                          insetPadding: EdgeInsets.all(20.w),
                          child: Container(
                            decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(15.r)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15.h),
                                TextModel(
                                  text: 'Are you sure delete this Card?',
                                  color: blue,
                                  fontSize: 18.sp,
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(height: 20.h),
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: TextModel(text: 'No', fontFamily: 'B', color: black, fontSize: 18.sp),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        myBankCardController.removeCard(index);
                                        Get.back();
                                      },
                                      child: TextModel(text: 'Yes', fontFamily: 'B', color: black, fontSize: 18.sp),
                                    ),
                                  ],
                                )
                              ],
                            ).paddingAll(20.w),
                          ),
                        ));
                      },
                      onTap: () {
                        Get.to(() => EditCardScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 126.h,
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(R.cardchip),
                                TextModel(
                                  text: cards.number.toString(),
                                  fontSize: 14.sp,
                                  color: white,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 64.h,
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextModel(
                                      text: cards.name,
                                      fontSize: 14.sp,
                                      color: white,
                                      fontFamily: 'B',
                                    ),
                                    TextModel(
                                      text: cards.date.toString(),
                                      fontSize: 10.sp,
                                      color: white,
                                      fontFamily: 'R',
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(R.mastercardlogo),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Get.dialog(Dialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    backgroundColor: white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: white),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldModel(
                            hint: 'Card number',
                            controller: myBankCardController.number,
                            textInputType: TextInputType.number,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: SvgPicture.asset(R.cardnumbericon),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextFieldModel(
                            hint: 'Card holder',
                            controller: myBankCardController.name,
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFieldModel(
                                  hint: 'Expiry date',
                                  controller: myBankCardController.date,
                                  textInputType: TextInputType.datetime,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (v) {
                                    if (myBankCardController.date.text.startsWith(RegExp('[2-9]'))) {
                                      myBankCardController.date.text = '0 ${myBankCardController.date.text}';
                                    }
                                  },
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please input a valid date';
                                    }
                                    final DateTime now = DateTime.now();
                                    final List<String> date = value.split(RegExp(r'/'));
                                    final int month = int.parse(date.first);
                                    final int year = int.parse('20${date.last}');
                                    final int lastDayOfMonth = month < 12 ? DateTime(year, month + 1, 0).day : DateTime(year + 1, 1, 0).day;
                                    final DateTime cardDate = DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

                                    if (cardDate.isBefore(now) || month > 12 || month == 0) {
                                      return 'invalid date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: TextFieldModel(
                                  hint: 'CVV',
                                  controller: myBankCardController.cvv,
                                  textInputType: TextInputType.number,
                                  validation: (value) {
                                    if (/*value!.isEmpty || */ value!.length < 3) {
                                      return "Please input a valid CVV";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 26.h),
                          ButtonWidget(
                              titleColor: white,
                              title: 'Save',
                              onTap: () {
                                myBankCardController.addCard(myBankCardController.number.text, myBankCardController.name.text,
                                    myBankCardController.date.text, myBankCardController.cvv.text);
                                myBankCardController.number.clear();
                                myBankCardController.name.clear();
                                myBankCardController.date.clear();
                                myBankCardController.cvv.clear();
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                  ));
                },
                child: Container(
                  height: 56.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: grey.withOpacity(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(R.plus, color: blue),
                      SizedBox(width: 8.w),
                      TextModel(
                        text: 'Add card',
                        fontSize: 16.sp,
                        fontFamily: 'B',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
