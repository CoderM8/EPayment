import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class SelectProviderController extends GetxController {
  RxInt isSelected = 0.obs;
  RxDouble hl = 0.0.obs;
  TextEditingController price = TextEditingController();

  RxInt isSelectPrice = 0.obs;

  void decreaseValue() {
    double currentValue = double.tryParse(price.text) ?? 0.0;
    if (currentValue > 0) {
      double newValue = currentValue - 1;
      price.text = newValue.toStringAsFixed(2);
    }
  }

  void increaseValue() {
    double currentValue = double.tryParse(price.text) ?? 0.0;
    double newValue = currentValue + 1;
    price.text = newValue.toStringAsFixed(2);
  }

  List<String> priceList = [
    '5',
    '10',
    '15',
    '20',
    '50',
    '100',
    '200',
    '500',
  ];

  List<SelectTopup> topupList = [
    SelectTopup(title: 'Bank of America', imgUrl: R.boiicon, subTitle: '**** **** **** 1121'),
    SelectTopup(title: 'Bank of Canada', imgUrl: R.boc, subTitle: '**** **** **** 1564'),
    SelectTopup(title: 'Paypal', imgUrl: R.paypal, subTitle: 'Easy payment'),
    SelectTopup(title: 'PayFast', imgUrl: R.payfast, subTitle: 'Easy payment'),
    SelectTopup(title: 'Western Union', imgUrl: R.wunion, subTitle: 'Easy payment'),
  ];
}

class SelectTopup {
  final String title;
  final String imgUrl;
  final String? subTitle;

  SelectTopup({required this.title, required this.imgUrl,  this.subTitle});
}
