import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/home_screen/home_controller.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';
import 'package:getx_practice/screens/post/post_controller.dart';
import 'package:getx_practice/screens/product/product_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PostController());
    Get.lazyPut(() => ImageController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
  }
}
