import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/withdraw_controller.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class WithDrawScreen extends StatelessWidget {
  WithDrawScreen({super.key});

  WithDrawController withDrawController = Get.put(WithDrawController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        centerTitle: true,
        title: TextModel(
          text: 'Withdraw',
          fontSize: 20.sp,
          fontFamily: 'B',
          color: black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Obx(() {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r), side: BorderSide(color: grey.withOpacity(0.2), width: 1.w)),
                    leading: ClipRRect(borderRadius: BorderRadius.circular(100.r), child: Image.asset(withDrawController.bImage.value)),
                    title: TextModel(
                      text: withDrawController.bName.value,
                      fontFamily: 'B',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: TextModel(
                      text: withDrawController.bNumber.value,
                      fontFamily: 'M',
                      fontSize: 12.sp,
                      textAlign: TextAlign.start,
                      color: grey,
                    ),
                    trailing: PopupMenuButton(
                      color: white,
                      icon: SvgPicture.asset(R.arrow_down),
                      position: PopupMenuPosition.under,
                      onSelected: (v) {
                        withDrawController.bankList.forEach((element) {
                          if (element.title == v) {
                            withDrawController.bName.value = element.title.toString();
                            withDrawController.bNumber.value = element.subTitle.toString();
                            withDrawController.bImage.value = element.imgUrl.toString();
                          }
                        });
                      },
                      itemBuilder: (context) => withDrawController.bankList.map((item) {
                        return PopupMenuItem(
                          value: item.title,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              leading: ClipRRect(borderRadius: BorderRadius.circular(100.r), child: Image.asset(item.imgUrl)),
                              title: TextModel(
                                text: item.title,
                                fontFamily: 'B',
                                fontSize: 16.sp,
                                textAlign: TextAlign.start,
                              ),
                              subtitle: TextModel(
                                text: item.subTitle!,
                                fontFamily: 'M',
                                fontSize: 12.sp,
                                textAlign: TextAlign.start,
                                color: grey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextModel(
                    text: '\$',
                    fontSize: 40.sp,
                    fontFamily: 'B',
                    color: grey,
                  ),
                  SizedBox(
                    width: 150.w,
                    child: TextFieldModel(
                      hint: 'Enter Price',
                      color: blue,
                      fontSize: 24.sp,
                      controller: withDrawController.price,
                      textInputType: TextInputType.number,
                      hideBorder: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TextModel(
                text: 'Maximum \$12,652.00',
                fontSize: 11.sp,
                fontFamily: 'R',
                color: grey,
              ),
              SizedBox(height: 35.h),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  itemCount: withDrawController.perList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20.w),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          withDrawController.isSelected.value = index;
                        },
                        child: Container(
                          height: 40.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: withDrawController.isSelected.value == index ? green : grey.withOpacity(0.1)),
                          child: Center(
                            child: TextModel(
                              text: withDrawController.perList[index],
                              fontFamily: 'B',
                              fontSize: 14.sp,
                              color: withDrawController.isSelected.value == index ? white : blue,
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
              SizedBox(
                height: 33.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ButtonWidget(
                    titleColor: white,
                    title: 'Withdraw',
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
                            maxChildSize: 0.6,
                            initialChildSize: 0.6,
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
                                    TextModel(
                                      text: 'Select your bank',
                                      fontFamily: 'B',
                                      fontSize: 20.sp,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 24.h),
                                    Obx(() {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1.w, color: grey.withOpacity(0.2)),
                                            borderRadius: BorderRadius.circular(16.r)),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.r), side: BorderSide(color: grey, width: 1.w)),
                                          leading: ClipRRect(
                                              borderRadius: BorderRadius.circular(100.r),
                                              child: Image.asset(withDrawController.bImage.value)),
                                          title: TextModel(
                                            text: withDrawController.bName.value,
                                            fontFamily: 'B',
                                            fontSize: 16.sp,
                                            textAlign: TextAlign.start,
                                          ),
                                          subtitle: TextModel(
                                            text: withDrawController.bNumber.value,
                                            fontFamily: 'M',
                                            fontSize: 12.sp,
                                            textAlign: TextAlign.start,
                                            color: grey,
                                          ),
                                          trailing: SvgPicture.asset(R.check),
                                        ),
                                      );
                                    }),
                                    SizedBox(height: 24.h),
                                    Container(
                                      decoration: BoxDecoration(color: grey.withOpacity(0.2), borderRadius: BorderRadius.circular(16.r)),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                        leading: SvgPicture.asset(R.bank),
                                        title: TextModel(
                                          text: 'Add new bank',
                                          fontFamily: 'B',
                                          fontSize: 16.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                        trailing: SvgPicture.asset(R.right_arrow),
                                      ),
                                    ),
                                    Spacer(),
                                    ButtonWidget(
                                        titleColor: white,
                                        title: 'Confirm',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
