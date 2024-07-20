import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController {
  RxString Occupation = ''.obs;
  RxList<String> occupationType = ['Manager', 'Employee', 'Staff'].obs;

  TextEditingController name = TextEditingController(text: 'Tommy jason');
  TextEditingController employer = TextEditingController(text: 'Overlay Design');
  TextEditingController phone = TextEditingController(text: '(1) 3256 8456 888');
  TextEditingController email = TextEditingController(text: 'tommyjason@gmail.com');
}
