import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/res.dart';

class PhoneBookController extends GetxController {
  TextEditingController search = TextEditingController();

  List<ContactList> contactList = [
    ContactList(title: 'Linda John', imgUrl: R.p1, subTitle: '(542) 555-2564'),
    ContactList(title: 'David William', imgUrl: R.p2, subTitle: '(552) 555-2464'),
    ContactList(title: 'Susan Charles', imgUrl: R.p3, subTitle: '(543) 555-2356'),
    ContactList(title: 'Sarah Sam', imgUrl: R.p4, subTitle: '(542) 555-7856'),
    ContactList(title: 'Monica Jess', imgUrl: R.p5, subTitle: '(542) 555-2589'),
    ContactList(title: 'Loran Hailey', imgUrl: R.p6, subTitle: '(543) 555-2760'),
  ];
}

class ContactList {
  final String title;
  final String imgUrl;
  final String subTitle;
  final String? time;

  ContactList({required this.title, required this.imgUrl, required this.subTitle, this.time});
}
