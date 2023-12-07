import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/data/model/post_model.dart';
import 'package:getx_practice/data/services/post_services.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  var postList = <Post>[].obs;
  var currentPage = 1;

  fetchPostDataController() async {
    try {
      isLoading(true);
      var data = await FetchPostDataAPI().fetchPostData();
      var postData = (data).map((json) => Post.fromJson(json)).toList();
      if (currentPage == 1) {
        postList.assignAll(postData);
      } else {
        postList.addAll(postData);
      }
      currentPage++;
    } finally {
      isLoading(false);
    }
  }
}
