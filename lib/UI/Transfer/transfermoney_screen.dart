import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/transfermoney_controller.dart';
import 'package:onlinepayment/UI/Transfer/transfersend_screen.dart';
import 'package:onlinepayment/res.dart';

class TransferMoneyScreen extends StatelessWidget {
  TransferMoneyScreen({super.key});

  TransferMoneyController transferMoneyController = Get.put(TransferMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'Transfer',
          textAlign: TextAlign.center,
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: TextModel(
              text: 'Choose cards',
              textAlign: TextAlign.center,
              fontSize: 20.sp,
              color: blue,
              fontFamily: 'B',
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Obx(() {
                    return InkWell(
                        onTap: () {
                          transferMoneyController.isSelected1.value = !transferMoneyController.isSelected1.value;
                          transferMoneyController.isSelected2.value = false;
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SvgPicture.asset(R.tcard1),
                            if (transferMoneyController.isSelected1.value)
                              Padding(
                                padding: EdgeInsets.all(15.w),
                                child: SvgPicture.asset(R.check),
                              ),
                          ],
                        ));
                  }),
                  SizedBox(width: 16.w),
                  Obx(() {
                    return InkWell(
                        onTap: () {
                          transferMoneyController.isSelected2.value = !transferMoneyController.isSelected2.value;
                          transferMoneyController.isSelected1.value = false;
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SvgPicture.asset(R.tcard2),
                            if (transferMoneyController.isSelected2.value)
                              Padding(
                                padding: EdgeInsets.all(15.w),
                                child: SvgPicture.asset(R.check),
                              ),
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextModel(
              text: 'Choose recipients',
              textAlign: TextAlign.start,
              fontSize: 20.sp,
              fontFamily: 'B',
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFieldModel(
              hint: 'Search contacts...',
              controller: transferMoneyController.search,
              textInputType: TextInputType.text,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(R.search),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 155.h,
            child: ListView.separated(
                itemCount: transferMoneyController.contactList.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20.w),
                separatorBuilder: (index, context) {
                  return SizedBox(width: 16.w);
                },
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        transferMoneyController.isSelected.value = index;
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 130.w,
                            height: 154.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  width: 1.h, color: transferMoneyController.isSelected.value == index ? green : grey.withOpacity(0.1)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  transferMoneyController.contactList[index].imgUrl,
                                  height: 48.w,
                                  width: 48.w,
                                ),
                                SizedBox(height: 16.h),
                                TextModel(
                                  text: transferMoneyController.contactList[index].title,
                                  textAlign: TextAlign.center,
                                  fontSize: 12.sp,
                                  fontFamily: 'B',
                                ),
                              ],
                            ),
                          ),
                          if (transferMoneyController.isSelected.value == index)
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(R.trueicon),
                            ),
                        ],
                      ),
                    );
                  });
                }),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ButtonWidget(
                titleColor: white,
                title: 'Continue',
                onTap: () {
                  Get.to(() => TransferSendScreen());
                }),
          ),
        ],
      ),
    );
  }
}
