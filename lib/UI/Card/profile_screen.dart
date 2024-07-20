import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/profile_controller.dart';
import 'package:onlinepayment/Location/location_screen.dart';
import 'package:onlinepayment/UI/Profile/faq_screen.dart';
import 'package:onlinepayment/UI/Profile/general_screen.dart';
import 'package:onlinepayment/UI/Profile/help_screen.dart';
import 'package:onlinepayment/UI/Profile/myaccount_screen.dart';
import 'package:onlinepayment/UI/Profile/referralcode_screen.dart';
import 'package:onlinepayment/UI/Profile/selectlanguage_screen.dart';
import 'package:onlinepayment/res.dart';

import '../Profile/changepassword_screen.dart';
import '../Profile/contact_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextModel(
          text: 'Profile',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 34.h),
            Center(
              child: Container(
                height: 85.w,
                width: 85.w,
                decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(0.1)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRRect(borderRadius: BorderRadius.circular(100.r), child: Image.asset(R.profilemen)),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextModel(
              text: 'Tommy Jason',
              fontSize: 20.sp,
              fontFamily: 'B',
            ),
            SizedBox(height: 8.h),
            TextModel(
              text: 'tommyjason@gmail.com',
              fontSize: 12.sp,
              color: grey,
              fontFamily: 'R',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  if (index == 3) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Divider(color: grey.withOpacity(0.2)),
                        SizedBox(height: 5.h),
                      ],
                    );
                  } else {
                    return SizedBox(height: 10.h);
                  }
                },
                itemCount: profileController.profileList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (index == 1) {
                        Get.to(() => MyAccountScreen());
                      } else if (index == 2) {
                        Get.to(() => ContactScreen());
                      } else if (index == 3) {
                        Get.to(() => SelectLanguageScreen());
                      } else if (index == 4) {
                        Get.to(() => LocationScreen());
                      } else if (index == 5) {
                        Get.to(() => GeneralScreen());
                      } else if (index == 0) {
                        Get.to(() => ReferralCodeScreen());
                      } else if (index == 6) {
                        Get.to(() => ChangePassword());
                      } else if (index == 7) {
                        Get.to(() => FAQScreen());
                      } else if (index == 8) {
                        Get.to(() => HelpScreen());
                      } else {}
                    },
                    tileColor: white,
                    leading: Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: grey.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(profileController.profileList[index].imgUrl),
                      ),
                    ),
                    title: TextModel(
                      text: profileController.profileList[index].title,
                      fontFamily: 'B',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    trailing: SvgPicture.asset(R.right_arrow),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
