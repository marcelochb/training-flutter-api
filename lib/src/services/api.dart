import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/cart_model.dart';

Future<List<Card>> fetch() async {
  final dio = Dio();
  final url = 'https://api.magicthegathering.io/v1/cards';
  // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  var response = await dio.get(url);
  var json = jsonDecode(response.data);
  return json;
}
