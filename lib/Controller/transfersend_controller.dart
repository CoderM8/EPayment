import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferSendController extends GetxController {
  RxString currency = 'USD'.obs;
  TextEditingController price = TextEditingController();
}
