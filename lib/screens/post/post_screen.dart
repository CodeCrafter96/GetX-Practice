import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/post/post_controller.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Obx(() {
        return SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
