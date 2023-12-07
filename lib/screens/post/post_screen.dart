import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/post/post_controller.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = Get.find<PostController>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        postController.fetchPostDataController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Obx(() {
        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 4),
          itemCount: postController.postList.length + 1,
          itemBuilder: (context, index) {
            if (index < postController.postList.length) {
              return ListTile(
                title: Text(postController.postList[index].title),
                subtitle: Text(postController.postList[index].body),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
