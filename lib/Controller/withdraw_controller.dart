import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class WithDrawController extends GetxController {
  TextEditingController price = TextEditingController();

  RxInt isSelected = 0.obs;
  RxString bName = 'Bank of America'.obs;
  RxString bNumber = '**** **** **** 1252'.obs;
  RxString bImage = R.boiicon.obs;
  List<String> perList = [
    '25%',
    '50%',
    '75%',
    '100%',
  ];

  List<WithDraw> bankList = [
    WithDraw(title: 'Bank of America', imgUrl: R.boiicon, subTitle: '**** **** **** 1121'),
    WithDraw(title: 'Bank of Canada', imgUrl: R.boc, subTitle: '**** **** **** 2569'),
  ];
}

class WithDraw {
  final String title;
  final String imgUrl;
  final String? subTitle;

  WithDraw({required this.title, required this.imgUrl, this.subTitle});
}
