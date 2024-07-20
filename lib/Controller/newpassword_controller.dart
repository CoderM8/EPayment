import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  final RxBool showPassword = true.obs;
  final RxBool showConPassword = true.obs;
}
