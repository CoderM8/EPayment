import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/UI/Bottom/home_screen.dart';
import 'package:onlinepayment/UI/Bottom/mycard_screen.dart';
import 'package:onlinepayment/UI/Bottom/activity_screen.dart';
import 'package:onlinepayment/UI/Card/profile_screen.dart';
import 'package:onlinepayment/UI/Card/scan_screen.dart';

class BottomController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxList<Widget> bottomPages = <Widget>[
    HomeScreen(),
    MyCardScreen(),
    ScanScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ].obs;
}
