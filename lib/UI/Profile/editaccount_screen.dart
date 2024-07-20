import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/editaccount_controller.dart';
import 'package:onlinepayment/res.dart';


class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({super.key});

  EditAccountController editAccountController = Get.put(EditAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Edit Account',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldModel(hint: 'Name', label: 'Your name', controller: editAccountController.name, textInputType: TextInputType.text),
              SizedBox(height: 20.h),
              TextModel(text: 'Select Occupation Type', fontSize: 16.sp, color: grey),
              SizedBox(height: 10.h),
              DropdownButtonFormField2(
                  isExpanded: true,
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  value: editAccountController.Occupation.value.isNotEmpty ? editAccountController.Occupation.value : null,
                  hint: TextModel(
                    text: 'Occupation',
                    fontSize: 16.sp,
                    color: grey,
                    fontFamily: 'M',
                  ),
                  decoration: InputDecoration(
                      fillColor: grey.withOpacity(0.1),
                      filled: true,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none)),
                  iconStyleData: IconStyleData(
                    icon: SvgPicture.asset(R.arrow_down),
                  ),
                  items: editAccountController.occupationType.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: TextModel(
                        text: item,
                        fontFamily: 'M',
                        fontSize: 16.sp,
                        color: grey,
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    editAccountController.Occupation.value = v.toString();
                  }),
              SizedBox(height: 20.h),
              TextFieldModel(
                  hint: 'Employer', label: 'Employer', controller: editAccountController.employer, textInputType: TextInputType.text),
              SizedBox(height: 20.h),
              TextFieldModel(
                  hint: 'Phone number', label: 'Phone name', controller: editAccountController.phone, textInputType: TextInputType.number),
              SizedBox(height: 20.h),
              TextFieldModel(hint: 'Email', label: 'Email', controller: editAccountController.email, textInputType: TextInputType.text),
              SizedBox(height: 30.h),
              ButtonWidget(
                  titleColor: white,
                  title: 'Save',
                  buttonColor: blue,
                  onTap: () {
                    Get.back();
                    Get.back();
                    // Get.to(() => SelectLanguageScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
