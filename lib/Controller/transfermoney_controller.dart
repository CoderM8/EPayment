import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class TransferMoneyController extends GetxController {
  RxBool isSelected1 = true.obs;
  RxBool isSelected2 = false.obs;

  TextEditingController search = TextEditingController();

  RxInt isSelected = 0.obs;

  List<Contact> contactList = [
    Contact(
      title: 'Linda\nJohn',
      imgUrl: R.p1,
    ),
    Contact(
      title: 'David William',
      imgUrl: R.p2,
    ),
    Contact(
      title: 'Susan\nCharles',
      imgUrl: R.p3,
    ),
  ];

  // final selectedItems = <String>{}.obs;
  //
  // void toggleSelection(String item) {
  //   if (selectedItems.contains(item)) {
  //     selectedItems.remove(item);
  //   } else {
  //     selectedItems.add(item);
  //   }
  // }
}

class Contact {
  final String title;
  final String imgUrl;

  Contact({required this.title, required this.imgUrl});
}
