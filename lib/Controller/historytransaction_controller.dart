import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class HistoryTransactionController extends GetxController {
  RxBool isSearch = false.obs;

  TextEditingController search = TextEditingController();

  List<AllTransaction> allTranscationList = [
    AllTransaction(title: 'Line premium', imgUrl: R.line, price: '- \$24.00', subTitle: 'Payment', time: 'December 28'),
    AllTransaction(title: 'Line premium', imgUrl: R.line, price: '- \$156.00', subTitle: 'Payment', time: 'November 28'),
    AllTransaction(title: 'Line premium', imgUrl: R.line, price: '- \$98.00', subTitle: 'Payment', time: 'October 28'),
    AllTransaction(title: 'Line premium', imgUrl: R.line, price: '- \$52.00', subTitle: 'Payment', time: 'September 28'),
  ];
}

class AllTransaction {
  final String title;
  final String imgUrl;
  final String price;
  final String time;
  final String subTitle;

  AllTransaction({required this.title, required this.imgUrl, required this.subTitle, required this.time, required this.price});
}
