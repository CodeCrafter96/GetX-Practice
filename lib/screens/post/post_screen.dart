import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/post/post_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = Get.find<PostController>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        if (value) {
          postController.postList.clear();
          print('List is cleared');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: Obx(() {
          return LazyLoadScrollView(
            onEndOfPage: () {
              postController.fetchPostDataController();
            },
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async =>
                  await postController.refreshPostDataController(),
              child: SingleChildScrollView(
                controller: postController.scrollController,
                child: Column(
                  children: [
                    for (var post in postController.postList)
                      ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      ),
                    if (postController.isLoading.value &&
                        postController.hasMoreData.value)
                      Container(
                        margin: EdgeInsets.only(bottom: 14),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
