import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/post/post_controller.dart';


class PostScreen extends StatelessWidget {
  //final PostController controller = Get.put(PostController());

  final postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Obx(() {
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(postController.postList[index].title),
              subtitle: Text(postController.postList[index].body),
            );
          },
        );
      }),
    );
  }
}
