import 'package:get/get.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';

class ImgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageController());
  }
}
