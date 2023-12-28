import 'package:get/get.dart';
import 'package:getx_practice/screens/wishlist/wishlist_controller.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}
