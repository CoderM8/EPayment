import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Card {
  final String number;
  final String name;
  final String date;
  final String cvv;

  Card(this.number, this.name, this.date, this.cvv);

  factory Card.fromJson(Map<String, dynamic> parsedJson) {
    return Card(parsedJson['number'] ?? "", parsedJson['name'] ?? "", parsedJson['date'] ?? "", parsedJson['cvv'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'date': date,
      'cvv': cvv,
    };
  }
}

class MyBankCardController extends GetxController {
  final TextEditingController number = TextEditingController(text: '0000 0000 0000 0000');
  final TextEditingController date = TextEditingController(text: '00/00');
  final TextEditingController name = TextEditingController();
  final TextEditingController cvv = TextEditingController(text: '000');

  RxList<Card> cards = <Card>[].obs;

  @override
  void onInit() {
    _loadCardFromLocalStorage();
    super.onInit();
  }

  void addCard(String number, String name, String date, String cvv) {
    cards.add(Card(number, name, date, cvv));
    _saveCardToLocalStorage();
  }

  void removeCard(int index) {
    cards.removeAt(index);
    _saveCardToLocalStorage();
  }

  Future<void> _saveCardToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> messagesString = [];
    for (var element in cards) {
      String jsonData = json.encode(element);
      messagesString.add(jsonData);
    }

    await prefs.setStringList('cards', messagesString);
    await _loadCardFromLocalStorage();
  }

  Future<void> _loadCardFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedCards = prefs.getStringList('cards');

    if (encodedCards != null) {
      cards.assignAll(encodedCards.map<Card>((json) {
        final cardData = Map<String, dynamic>.from(jsonDecode(json));
        return Card.fromJson(cardData);
      }));
    }
  }
}
