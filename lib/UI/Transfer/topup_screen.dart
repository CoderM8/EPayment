import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/topup_controller.dart';
import 'package:onlinepayment/UI/Transfer/confirmtopup_screen.dart';
import 'package:onlinepayment/res.dart';

class TopupScreen extends StatelessWidget {
  TopupScreen({super.key});

  TopupController topupController = Get.put(TopupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'Top Up',
          fontSize: 20.sp,
          fontFamily: 'B',
          color: black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r), side: BorderSide(width: 1.w, color: grey.withOpacity(0.2))),
                leading: Image.asset(R.debitcardicon),
                title: TextModel(
                  text: 'Debit',
                  fontFamily: 'B',
                  fontSize: 18.sp,
                  color: grey,
                  textAlign: TextAlign.start,
                ),
                trailing: TextModel(
                  text: '\$11,510.00 ▿',
                  fontFamily: 'B',
                  fontSize: 18.sp,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 16.h),
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
                            text: 'Top up fee \$3.0',
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
                                  value: topupController.currency.value.isEmpty ? null : topupController.currency.value,
                                  elevation: 16,
                                  onChanged: (String? newValue) {
                                    topupController.currency.value = newValue!;
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
                              controller: topupController.price,
                              textInputType: TextInputType.number,
                              hideBorder: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 24.h),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  itemCount: topupController.priceList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          topupController.price.text = topupController.priceList[index];
                          topupController.isSelected.value = index;
                        },
                        child: Container(
                          height: 40.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: topupController.isSelected.value == index ? green : grey.withOpacity(0.1)),
                          child: Center(
                            child: TextModel(
                              text: '\$${topupController.priceList[index]}',
                              fontFamily: 'B',
                              fontSize: 14.sp,
                              color: topupController.isSelected.value == index ? white : blue,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20.w);
                  },
                ),
              ),
              SizedBox(height: 68.h),
              ButtonWidget(
                  titleColor: white,
                  title: 'Continue',
                  onTap: () {
                    Get.to(() => ConfirmTopupScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
