import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget({
    super.key,
    required this.imgList,
  });

  final List imgList;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imgList[index].thumbnailUrl),
                ),
                Expanded(child: Text(imgList[index].title)),
              ],
            ),
          );
        },
      );
    });
  }
}
