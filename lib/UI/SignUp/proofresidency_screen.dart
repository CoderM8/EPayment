import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/proofresidency_controller.dart';
import 'package:onlinepayment/UI/Card/cardonboarding_screen.dart';
import 'package:onlinepayment/res.dart';

class ProofResidencyScreen extends StatelessWidget {
  ProofResidencyScreen({super.key});

  ProofResidencyController proofResidencyController = Get.put(ProofResidencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(text: 'Proof of residency', fontFamily: 'B', fontSize: 24.sp, textAlign: TextAlign.start),
            SizedBox(width: 12.h),
            TextModel(text: 'Prove you live in United States', fontFamily: 'R', fontSize: 16.sp, textAlign: TextAlign.start, color: grey),
            SizedBox(height: 55.h),
            TextModel(text: 'Nationality', fontFamily: 'M', fontSize: 16.sp, textAlign: TextAlign.start, color: grey),
            SizedBox(height: 16.h),
            Obx(() {
              return ListTile(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      flagSize: 30,
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16.sp, color: blue),
                      bottomSheetHeight: 500,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      inputDecoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        counterStyle: const TextStyle(color: black),
                        fillColor: grey.withOpacity(0.1),
                        filled: true,
                        hintText: 'Search',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(R.search),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)), borderSide: BorderSide(width: 1.w, color: black)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)), borderSide: BorderSide(width: 1.w, color: white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)), borderSide: BorderSide(width: 1.w, color: white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)), borderSide: BorderSide(width: 1.w, color: white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                            borderSide: BorderSide(width: 1.w, color: const Color(0xffDC3545))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                            borderSide: BorderSide(width: 1.w, color: const Color(0xffDC3545))),
                      ),
                    ),
                    onSelect: (Country country) {
                      proofResidencyController.countryName.value = country.name;
                      proofResidencyController.countryFlag.value = country.flagEmoji;
                    },
                  );
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                tileColor: lightgrey.withOpacity(1),
                leading: TextModel(
                  text: proofResidencyController.countryFlag.value,
                  fontFamily: 'B',
                  fontSize: 20.sp,
                  textAlign: TextAlign.start,
                ),
                title: TextModel(
                  text: proofResidencyController.countryName.value,
                  fontFamily: 'B',
                  fontSize: 18.sp,
                  textAlign: TextAlign.start,
                ),
                trailing: TextModel(
                  text: 'Change',
                  fontFamily: 'B',
                  color: black,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                ),
              );
            }),
            SizedBox(height: 32.h),
            TextModel(text: 'Method of verification', fontFamily: 'M', fontSize: 16.sp, textAlign: TextAlign.start, color: grey),
            SizedBox(height: 16.h),
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(width: 1.w, color: lightgrey.withOpacity(1)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  ListTile(
                    leading: Container(
                        height: 40.w,
                        width: 40.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: lightgrey,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(R.passport, width: 26.w, height: 26.w)),
                    title: TextModel(
                      text: 'Passport',
                      fontFamily: 'B',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    trailing: SvgPicture.asset(R.right_arrow),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 1.w,
                      color: lightgrey.withOpacity(1),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    onTap: () {
                      Get.to(() => CardOnboardingScreen());
                    },
                    leading: Container(
                        height: 40.w,
                        width: 40.w,
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: lightgrey,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(R.identitycard, width: 26.w, height: 26.w)),
                    title: TextModel(
                      text: 'Identity Card',
                      fontFamily: 'B',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    trailing: SvgPicture.asset(R.right_arrow),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 1.w,
                      color: lightgrey.withOpacity(1),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    leading: Container(
                        height: 40.w,
                        width: 40.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: lightgrey,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(R.document, width: 26.w, height: 26.w)),
                    title: TextModel(
                      text: 'Digital Document',
                      fontFamily: 'B',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    trailing: SvgPicture.asset(R.right_arrow),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
