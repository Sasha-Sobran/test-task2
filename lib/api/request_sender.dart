import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:testik/models/poet.dart';

class RequestSender {
  Future<List<Poet>> getPoetsList() async {
    final response = await http.get(Uri.parse("https://freetestapi.com/api/v1/poets"));
    final List<dynamic> responseData = jsonDecode(response.body);


    List<Poet> poets =
        responseData.map((element) => Poet.fromJson(element)).toList();

    return poets;
  }
}