import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';

import 'package:getx_practice/widget/photo_widget.dart';

class ImgScreen extends StatelessWidget {
  final imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: PhotoWidget(imgList: imageController.imgList),
    );
  }
}
