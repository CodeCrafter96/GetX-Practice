import 'package:get/get.dart';
import 'package:getx_practice/screens/post/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
  }
}
