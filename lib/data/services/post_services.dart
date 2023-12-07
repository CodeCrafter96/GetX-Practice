import 'dart:convert';

import 'package:getx_practice/data/services/api/api.dart';
import 'package:http/http.dart' as http;

class FetchPostDataAPI {
  Future<List<dynamic>> fetchPostData() async {
    final response = await http.get(Uri.parse(API().getAPI('/posts')));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Something went wrong");
    }
    return [];
    // throw "Data not found";
  }
}
