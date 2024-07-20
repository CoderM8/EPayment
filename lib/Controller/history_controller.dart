import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class HistoryController extends GetxController {
  RxBool showBal = true.obs;
  RxBool isSearch = false.obs;

  TextEditingController search = TextEditingController();

  List<TranHistory> transcationList = [
    TranHistory(title: 'Amazon', imgUrl: R.amazon, price: '- \$59.00', subTitle: 'Payment'),
    TranHistory(title: 'Sports', imgUrl: R.ball, price: '- \$15.99', subTitle: 'Payment'),
    TranHistory(title: 'Bank of America', imgUrl: R.deposit, price: '+ \$2,045.00', subTitle: 'Deposit'),
  ];
  List<TranHistory> transcationList2 = [
    TranHistory(title: 'Bitcoin', imgUrl: R.bitcoin, price: '- \$2,550.99', subTitle: 'Deposit'),
    TranHistory(title: 'Paypal', imgUrl: R.paypaloutline, price: '+ \$2,328.00', subTitle: 'Freelance'),
    TranHistory(title: 'Spotify Premium', imgUrl: R.spotify, price: '- \$1,328.00', subTitle: 'Payment'),
  ];
}

class TranHistory {
  final String title;
  final String imgUrl;
  final String price;
  final String subTitle;

  TranHistory({required this.title, required this.imgUrl, required this.subTitle, required this.price});
}
