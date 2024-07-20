import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateCardController extends GetxController {
  RxBool isSelected1 = true.obs;
  RxBool isSelected2 = false.obs;
  RxBool isSelected3 = false.obs;

  RxString countryName = 'India'.obs;
  RxString countryFlag = '🇮🇳'.obs;

  final TextEditingController cardNumber = TextEditingController(text: '0000 0000 0000 0000');
  final TextEditingController date = TextEditingController(text: '00/00');
  final TextEditingController cardName = TextEditingController();
  final TextEditingController cvv = TextEditingController(text: '000');
}
