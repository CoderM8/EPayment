// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/reason_controller.dart';

import 'createpin_screen.dart';

class ReasonScreen extends StatelessWidget {
  ReasonScreen({super.key});

  ReasonController reasonController = Get.put(ReasonController());

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
            TextModel(text: 'Main reason for using\nSmartpay', fontFamily: 'B', fontSize: 24.sp, textAlign: TextAlign.start),
            SizedBox(height: 12.h),
            TextModel(
                text: 'We need to know this for regulatory\nreasons. And also we’re curious!',
                fontFamily: 'R',
                fontSize: 16.sp,
                color: grey,
                textAlign: TextAlign.start),
            SizedBox(height: 32.h),
            Obx(() {
              reasonController.selectedItems.value;
              return GridView.builder(
                  itemCount: reasonController.reasonList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 16.0, crossAxisSpacing: 16.0, childAspectRatio: 165 / 114),
                  itemBuilder: (context, index) {
                    final item = reasonController.reasonList[index];
                    final isSelected = reasonController.selectedItems.contains(item.title);
                    return InkWell(
                        onTap: () {
                          reasonController.toggleSelection(item.title);
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: isSelected ? green : white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: isSelected ? null : Border.all(width: 1.w, color: grey.withOpacity(0.1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                reasonController.reasonList[index].imgUrl,
                                color: isSelected ? white : black,
                              ),
                              SizedBox(height: 10.h),
                              Expanded(
                                child: TextModel(
                                    text: reasonController.reasonList[index].title,
                                    fontFamily: 'M',
                                    fontSize: 14.sp,
                                    color: isSelected ? white : blue,
                                    textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                        ));
                  });
            }),
            SizedBox(height: 32.h),
            const Spacer(),
            ButtonWidget(
              title: 'Continue',
              titleColor: white,
              onTap: () {
                Get.to(() => CreatePinScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
