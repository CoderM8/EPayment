import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/myaccount_controller.dart';
import 'package:onlinepayment/UI/Profile/editaccount_screen.dart';
import 'package:onlinepayment/res.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});

  MyAccountController myAccountController = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Account Info',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(() {
                myAccountController.isImageValid.value;
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    if (myAccountController.selectedImage == null) ...[
                      Image.asset(R.profilemen),
                    ] else ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.file(
                          File(myAccountController.selectedImage!.path),
                          width: 80.w,
                          height: 80.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
                              ),
                              builder: (context) {
                                return SizedBox(
                                  height: 200.h,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      TextModel(
                                        text: 'Upload photo',
                                        fontSize: 18.sp,
                                        color: black,
                                      ),
                                      SizedBox(height: 30.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ButtonWidget(
                                            width: 150.w,
                                            icon: const Icon(Icons.photo_library_outlined, color: white),
                                            title: 'Gallery',
                                            titleColor: blue,
                                            onTap: () async {
                                              await myAccountController.selectImage(imageSource: ImageSource.gallery);
                                            },
                                          ),
                                          SizedBox(width: 16.w),
                                          ButtonWidget(
                                            width: 150.w,
                                            icon: const Icon(Icons.camera, color: white),
                                            title: 'Camera',
                                            titleColor: blue,
                                            onTap: () async {
                                              await myAccountController.selectImage(imageSource: ImageSource.camera);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                            height: 24.w,
                            width: 24.w,
                            decoration: BoxDecoration(color: blue, shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SvgPicture.asset(R.edit),
                            ))),
                  ],
                );
              }),
            ),
            SizedBox(height: 16.h),
            TextModel(
              text: 'Personal Info',
              fontSize: 20.sp,
              color: grey,
              fontFamily: 'B',
            ),
            SizedBox(height: 32.h),
            Container(
              height: 200.h,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(15.w),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r), border: Border.all(color: grey.withOpacity(0.2), width: 1.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'Your name',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      TextModel(
                        text: 'Tommy Jason',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'Occupation',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      TextModel(
                        text: 'Manager',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'Employer',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      TextModel(
                        text: 'Overlay Design',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'U.S Citizen',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      Obx(() {
                        return CupertinoSwitch(
                            value: myAccountController.onoff.value,
                            activeColor: green,
                            thumbColor: white,
                            onChanged: (val) async {
                              myAccountController.onoff.value = val;
                            });
                      }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            TextModel(
              text: 'Contact Info',
              fontSize: 20.sp,
              color: grey,
              fontFamily: 'B',
            ),
            SizedBox(height: 16.h),
            Container(
              height: 100.h,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(15.w),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r), border: Border.all(color: grey.withOpacity(0.2), width: 1.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'Phone number',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      TextModel(
                        text: '(1) 3256 8456 888',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextModel(
                        text: 'Email',
                        fontSize: 14.sp,
                        color: grey,
                        fontFamily: 'M',
                      ),
                      TextModel(
                        text: 'tommyjason@gmail.com',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            ButtonWidget(
                titleColor: white,
                title: 'Edit',
                buttonColor: blue,
                onTap: () {
                  Get.to(() => EditAccountScreen());
                }),
          ],
        ),
      ),
    );
  }
}
