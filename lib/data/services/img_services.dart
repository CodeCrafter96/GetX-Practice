// serives class
import 'dart:convert';

import 'package:getx_practice/data/model/photos_model.dart';
import 'package:getx_practice/data/services/api/api.dart';
import 'package:http/http.dart' as http;

import 'package:getx_practice/data/model/post_model.dart';

class FetchImageDataAPI {
  Future<List<dynamic>> fetchImgData() async {
    final response = await http.get(Uri.parse(API().getAPI('/photos')));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Something went wrong");
    }
    return [];
    // throw "Data not found";
  }
}
