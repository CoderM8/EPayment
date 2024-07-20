import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class ActivityController extends GetxController {
  RxString time = 'Day'.obs;

  List<Categories> categoriesList = [
    Categories(title: 'Investments', imgUrl: R.bank, subTitle: '\$595.20'),
    Categories(title: 'Travelling', imgUrl: R.travel, subTitle: '\$312.52'),
    Categories(title: 'Subscriptions', imgUrl: R.crown, subTitle: '\$117.92'),
  ];
}

class Categories {
  final String title;
  final String imgUrl;
  final String subTitle;

  Categories({required this.title, required this.imgUrl, required this.subTitle});
}
