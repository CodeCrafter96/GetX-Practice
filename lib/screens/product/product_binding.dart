import 'package:get/get.dart';
import 'package:getx_practice/screens/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
