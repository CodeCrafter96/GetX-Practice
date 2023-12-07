import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
