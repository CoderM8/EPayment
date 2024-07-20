import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../res.dart';

class OnBoardingController extends GetxController {
  Rx<SystemUiOverlayStyle> mySystemThemeBottom = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black.withOpacity(0.5),
  ).obs;
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  List<OnBoarding> boardList = [
    OnBoarding(
        title: 'Finance app the safest\n and most trusted',
        imgUrl: R.b1,
        description: 'Your finance work starts here. Our here to help you\n track and deal with speeding up your transactions.'),
    OnBoarding(
        title: 'The fastest transaction\n process only here',
        imgUrl: R.b2,
        description: 'Get easy to pay all your bills with just a few steps.\n Paying your bills become fast and efficient.'),
  ];
}

class OnBoarding {
  final String title;
  final String imgUrl;
  final String description;

  OnBoarding({required this.title, required this.imgUrl, required this.description});
}
