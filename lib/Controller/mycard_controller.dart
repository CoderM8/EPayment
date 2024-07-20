import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bank {
  final String bname;
  final String cname;

  Bank(this.bname, this.cname);

  factory Bank.fromJson(Map<String, dynamic> parsedJson) {
    return Bank(parsedJson['bname'] ?? "", parsedJson['cname'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'bname': bname,
      'cname': cname,
    };
  }
}

class MyCardController extends GetxController {
  TextEditingController bName = TextEditingController();
  TextEditingController cName = TextEditingController();

  RxList<Bank> banks = <Bank>[].obs;

  @override
  void onInit() {
    loadBanksFromLocalStorage();

    super.onInit();
  }

  void addBank(String bname, String cname) {
    banks.add(Bank(bname, cname));
    _saveBanksToLocalStorage();
  }

  void removeBank(int index) {
    banks.removeAt(index);
    _saveBanksToLocalStorage();
  }

  Future<void> _saveBanksToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> messagesString = [];
    for (var element in banks) {
      String jsonData = json.encode(element);
      messagesString.add(jsonData);
    }

    await prefs.setStringList('banks', messagesString);
    await loadBanksFromLocalStorage();
  }

  Future<void> loadBanksFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedBanks = prefs.getStringList('banks');

    if (encodedBanks != null) {
      banks.assignAll(encodedBanks.map<Bank>((json) {
        final bankData = Map<String, dynamic>.from(jsonDecode(json));
        return Bank.fromJson(bankData);
      }));
    }
  }
}
