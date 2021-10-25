import 'dart:convert';

import 'package:coin_convert/app/shared/class/CoinClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var api_key = '9a1248306426af75567e86d6e0f39474';
var url_list =
    Uri.parse('http://api.exchangeratesapi.io/v1/symbols?access_key=$api_key');
var url_currencies =
    Uri.parse('http://api.exchangeratesapi.io/v1/latest?access_key=${api_key}');

late List<Coin> listCoin = [];
late var rates = Map();

Coin coinOrigin = Coin.construtor("BRL", "Real brasileiro");
Coin coinDestiny = Coin.construtor("USD", "Dolar americano");
final controllerNum = TextEditingController();
//double amount = 0;

Future<Map> getListCoin() async {
  var response = await http.get(url_list);
  var json = jsonDecode(response.body) as Map;
  var symbols = json['symbols'] as Map;

  if (listCoin.isEmpty) {
    for (final name in symbols.keys) {
      final value = symbols[name];
      listCoin.add(Coin.construtor(name, value));
    }
  }

  return json;
}

Future<Map> getAllRates() async {
  var response = await http.get(url_currencies);
  final json = jsonDecode(response.body) as Map;
  rates = json['rates'] as Map;

  return rates;
}

String convertCoin(String value, String coinOrigin, String coinDestiny) {
  String output = (double.parse(value) / rates[coinOrigin] * rates[coinDestiny])
      .toStringAsFixed(2)
      .toString();
  return output;
}
