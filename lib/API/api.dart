import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  //...
  Future<List<ApiCall>> getData() async {
    final response = await http
        .get(Uri.parse('https://naeapi--wallettrue.repl.co/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ApiCall.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
  //...
}

ApiCall apiCallFromJson(String str) => ApiCall.fromJson(json.decode(str));

String apiCallToJson(ApiCall data) => json.encode(data.toJson());

class ApiCall {
  ApiCall({
    required this.name,
    required this.img,
    required this.price,
  });

  String name;
  String img;
  String price;

  factory ApiCall.fromJson(Map<String, dynamic> json) => ApiCall(
        name: json["name"],
        img: json["img"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "price": price,
      };
}
