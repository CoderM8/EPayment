import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/editcard_controller.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class EditCardScreen extends StatelessWidget {
  EditCardScreen({super.key});

  EditCardController editCardController = Get.put(EditCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Edit Card',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            return Stack(
              alignment: Alignment.centerRight,
              children: [
                if (editCardController.isSelected2.value) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2),
                  ),
                ] else if (editCardController.isSelected3.value) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2c3),
                  ),
                ] else ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2c1),
                  ),
                ],
                Container(
                  height: 134.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), bottomLeft: Radius.circular(12.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            editCardController.isSelected1.value = !editCardController.isSelected1.value;
                            editCardController.isSelected2.value = false;
                            editCardController.isSelected3.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: cream,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (editCardController.isSelected1.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            editCardController.isSelected2.value = !editCardController.isSelected2.value;
                            editCardController.isSelected1.value = false;
                            editCardController.isSelected3.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (editCardController.isSelected2.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            editCardController.isSelected3.value = !editCardController.isSelected3.value;
                            editCardController.isSelected1.value = false;
                            editCardController.isSelected2.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: cream,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (editCardController.isSelected3.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 46.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: grey.withOpacity(0.1), borderRadius: BorderRadius.circular(16.r)),
              child: Obx(() {
                return TabBar(
                  indicatorColor: Colors.transparent,
                  controller: editCardController.tabController,
                  physics: const BouncingScrollPhysics(),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  labelColor: grey.withOpacity(0.1),
                  labelPadding: EdgeInsets.all(5.r),
                  onTap: (index) {
                    editCardController.tabIndex.value = index;
                  },
                  tabs: [
                    Tab(
                      child: Container(
                        height: 44.h,
                        width: 155.w,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: editCardController.tabIndex.value == 0 ? white : Colors.transparent)),
                        child: TextModel(
                          text: 'Personal',
                          color: editCardController.tabIndex.value == 0 ? blue : grey,
                          fontSize: 14.sp,
                          fontFamily: "B",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 44.h,
                        width: 155.w,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: editCardController.tabIndex.value == 1 ? white : Colors.transparent)),
                        child: TextModel(
                          text: 'Manage',
                          color: editCardController.tabIndex.value == 1 ? blue : grey,
                          fontSize: 14.sp,
                          fontFamily: "B",
                        ),
                      ),
                    ),
                    // Tab(
                    //   child: Container(
                    //     height: 44.h,
                    //     width: 105.w,
                    //     alignment: Alignment.center,
                    //     decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12.r),
                    //         color: editCardController.tabIndex.value == 2 ? white : Colors.transparent)),
                    //     child: TextModel(
                    //       text: 'Detail',
                    //       color: editCardController.tabIndex.value == 2 ? blue : grey,
                    //       fontSize: 14.sp,
                    //       fontFamily: "B",
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: editCardController.tabController,
              children: [
                Personal(),
                Manage(),
                // Detail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Personal extends StatelessWidget {
  Personal({super.key});

  EditCardController editCardController = Get.put(EditCardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Customer Name',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: 'Jordan Max',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Customer Phone',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: '9568582365',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Customer DOB',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: '12-12-2001',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Bank Name',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: 'Bank of America',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Bank Branch',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: 'America',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextModel(
                text: 'Bank IFSC',
                fontFamily: 'B',
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              TextModel(
                text: 'BOA234759495',
                fontFamily: 'B',
                fontSize: 14.sp,
                color: grey,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Spacer(),
          ButtonWidget(
              titleColor: white,
              title: 'Save',
              onTap: () {
                Get.offAll(() => BottomScreen());
              }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class Manage extends StatelessWidget {
  Manage({super.key});

  EditCardController editCardController = Get.put(EditCardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            tileColor: white,
            leading: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: grey.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(R.physicalcard),
              ),
            ),
            title: TextModel(
              text: 'Block physical card',
              fontFamily: 'B',
              fontSize: 14.sp,
              textAlign: TextAlign.start,
            ),
            trailing: Obx(() {
              return CupertinoSwitch(
                  value: editCardController.onoff4.value,
                  activeColor: green,
                  thumbColor: white,
                  onChanged: (val) async {
                    editCardController.onoff4.value = val;
                  });
            }),
          ),
          SizedBox(height: 15.h),
          ListTile(
            onTap: () {
              // Get.to(() => TransferMoneyScreen());
            },
            tileColor: white,
            leading: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: grey.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(R.contactless),
              ),
            ),
            title: TextModel(
              text: 'Enable contact',
              fontFamily: 'B',
              fontSize: 14.sp,
              textAlign: TextAlign.start,
            ),
            trailing: Obx(() {
              return CupertinoSwitch(
                  value: editCardController.onoff5.value,
                  activeColor: green,
                  thumbColor: white,
                  onChanged: (val) async {
                    editCardController.onoff5.value = val;
                  });
            }),
          ),
          SizedBox(height: 15.h),
          ListTile(
            onTap: () {
              // Get.to(() => TransferMoneyScreen());
            },
            tileColor: white,
            leading: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: grey.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(R.lockicon),
              ),
            ),
            title: TextModel(
              text: 'Lock pin',
              fontFamily: 'B',
              fontSize: 14.sp,
              textAlign: TextAlign.start,
            ),
            trailing: Obx(() {
              return CupertinoSwitch(
                  value: editCardController.onoff6.value,
                  activeColor: green,
                  thumbColor: white,
                  onChanged: (val) async {
                    editCardController.onoff6.value = val;
                  });
            }),
          ),
          Spacer(),
          ButtonWidget(
              titleColor: white,
              title: 'Save',
              onTap: () {
                Get.offAll(() => BottomScreen());
              }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
