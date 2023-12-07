import 'dart:convert';

import 'package:getx_practice/data/services/api/api.dart';
import 'package:getx_practice/data/services/api/fakestoreapi.dart';
import 'package:http/http.dart' as http;

class FetchProductDataAPI {
  Future<List<dynamic>> fetchProductData() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body);
    } else {
      print("Something went wrong");
    }

    return [];
  }
}
