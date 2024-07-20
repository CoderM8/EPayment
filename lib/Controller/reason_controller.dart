import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class ReasonController extends GetxController {
  List<Reason> reasonList = [
    Reason(
      title: 'Spend or\nsave daily',
      imgUrl: R.r1,
    ),
    Reason(
      title: 'Fast my\ntransactions',
      imgUrl: R.r2,
    ),
    Reason(
      title: 'Payments\nto friends',
      imgUrl: R.r3,
    ),
    Reason(
      title: 'Online\npayments',
      imgUrl: R.r4,
    ),
    Reason(
      title: 'Spend while\ntravelling',
      imgUrl: R.r5,
    ),
    Reason(
      title: 'Your financial\nassets',
      imgUrl: R.r6,
    ),
  ];

  final selectedItems = <String>{}.obs;

  void toggleSelection(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }
}

class Reason {
  final String title;
  final String imgUrl;

  Reason({required this.title, required this.imgUrl});
}
