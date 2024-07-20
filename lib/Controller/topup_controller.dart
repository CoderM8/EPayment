import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopupController extends GetxController {
  RxString currency = 'USD'.obs;
  RxInt isSelected = 0.obs;
  TextEditingController price = TextEditingController();

  List<String> priceList = [
    '1500.00',
    '3000.00',
    '4500.00',
    '6000.00',
  ];
}
