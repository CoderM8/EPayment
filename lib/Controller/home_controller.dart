import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;

  List<Transaction> transcationList = [
    Transaction(title: 'Sports', imgUrl: R.ball, price: '- \$15.99', subTitle: 'Payment'),
    Transaction(title: 'Bank of America', imgUrl: R.deposit, price: '+ \$2,045.00', subTitle: 'Deposit'),
    Transaction(title: 'To Brody Armando', imgUrl: R.arrow_cross, price: '- \$986.00', subTitle: 'Sent'),
  ];
}

class Transaction {
  final String title;
  final String imgUrl;
  final String price;
  final String subTitle;

  Transaction({required this.title, required this.imgUrl, required this.subTitle, required this.price});
}
