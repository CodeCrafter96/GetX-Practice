import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/data/model/post_model.dart';
import 'package:getx_practice/data/services/post_services.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  var postList = <Post>[].obs;
  final scrollController = ScrollController();
  final currentPage = 1.obs;
  var hasMoreData = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        currentPage.value++;
        fetchPostDataController();
      }
    });
    fetchPostDataController();
  }

  fetchPostDataController() async {
    try {
      isLoading(true);
      var data = await FetchPostDataAPI().fetchPostData(currentPage.value);
      var postData = (data).map((json) => Post.fromJson(json)).toList();
      // postList.assignAll(postData);
      if (postData.length < 10) {
        hasMoreData.value = false;
      }
      if (currentPage.value == 1) {
        postList.assignAll(postData.take(10).toList());
      } else {
        postList.addAll(postData);
      }
    } finally {
      isLoading(false);
    }
  }

  // Pull to refresh data

  Future<void> refreshPostDataController() async {
    try {
      await fetchPostDataController();
    } finally {
      Future.delayed(Duration(seconds: 8), () {});
    }
  }

  void reinitializePostController() {
    Get.delete<PostController>();
    Get.put(PostController());
  }
}
