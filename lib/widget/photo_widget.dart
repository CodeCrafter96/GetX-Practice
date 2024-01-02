import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoWidget extends StatefulWidget {
  PhotoWidget({
    super.key,
    required this.imgList,
  });

  final List imgList;

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  late AnimationController _animationController;
  bool startAnimation = false;
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.imgList.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (index * 200)),
            transform: Matrix4.translationValues(
                startAnimation ? 0 : screenWidth, 0, screenHeight),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.imgList[index].thumbnailUrl),
                ),
                Expanded(child: Text(widget.imgList[index].title)),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
