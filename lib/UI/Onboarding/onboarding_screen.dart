import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Controller/onboarding_controller.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';
import '../SignIn/signin_screen.dart';

class OnBoardingScreen extends GetView {
  OnBoardingScreen({Key? key}) : super(key: key);
  final OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top: 55.h, left: 24.w, right: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Obx(() {
                return InkWell(
                  onTap: () {
                    Get.offAll(() => SignInScreen());
                  },
                  child: TextModel(
                    text: onBoardingController.currentIndex.value < onBoardingController.boardList.length - 1 ? '' : 'Skip',
                    fontSize: 16.sp,
                    fontFamily: 'B',
                  ),
                );
              }),
            ),
            SizedBox(height: 70.h),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: onBoardingController.pageController,
                onPageChanged: (int index) {
                  onBoardingController.currentIndex.value = index;
                },
                itemCount: onBoardingController.boardList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(onBoardingController.boardList[index].imgUrl),
                      SizedBox(height: 40.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextModel(
                            text: onBoardingController.boardList[index].title,
                            fontSize: 24.sp,
                            color: blue,
                            fontFamily: "B",
                          ),
                          SizedBox(height: 16.h),
                          TextModel(
                              text: onBoardingController.boardList[index].description, fontSize: 11.sp, color: black, fontFamily: "R"),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: onBoardingController.pageController,
              count: onBoardingController.boardList.length,
              effect: ExpandingDotsEffect(
                activeDotColor: blue,
                dotColor: grey,
                dotHeight: 10.w,
                dotWidth: 10.w,
                expansionFactor: 5.w,
              ),
            ),
            SizedBox(height: 45.h),
            Obx(() {
              return ButtonWidget(
                title: onBoardingController.currentIndex.value < onBoardingController.boardList.length - 1 ? 'Next' : 'Get Started',
                titleColor: white,
                onTap: () {
                  if (onBoardingController.currentIndex.value < onBoardingController.boardList.length - 1) {
                    onBoardingController.pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
                  } else {
                    Get.to(() => SignInScreen());
                  }
                },
              );
            }),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
