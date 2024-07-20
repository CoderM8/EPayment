import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/country_controller.dart';
import 'package:onlinepayment/res.dart';

import '../../Constant/color.dart';
import 'reason_screen.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({super.key});

  CountryController countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(text: 'Country of Residence', fontFamily: 'B', fontSize: 24.sp),
            SizedBox(height: 12.h),
            TextModel(
              text: 'Please select all the countries that\nyou’re a tax recident in',
              fontFamily: 'R',
              fontSize: 16.sp,
              color: grey,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32.h),
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
                      countryController.countryName.value = country.name;
                      countryController.countryFlag.value = country.flagEmoji;
                    },
                  );
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                tileColor: lightgrey.withOpacity(1),
                leading: TextModel(
                  text: countryController.countryFlag.value,
                  fontFamily: 'B',
                  fontSize: 20.sp,
                  textAlign: TextAlign.start,
                ),
                title: TextModel(
                  text: countryController.countryName.value,
                  fontFamily: 'B',
                  fontSize: 18.sp,
                  textAlign: TextAlign.start,
                ),
                trailing: SvgPicture.asset(R.arrow_down),
              );
            }),
            Spacer(),
            ButtonWidget(
              title: 'Continue',
              titleColor: white,
              onTap: () {
                Get.to(() => ReasonScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
