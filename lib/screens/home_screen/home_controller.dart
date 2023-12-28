import 'package:get/get.dart';
import 'package:getx_practice/routes/app_routes.dart';

class HomeController extends GetxController {
  void goToPostScreen() {
    Get.toNamed(AppRoutes.postScreen);
  }

  void goToImageScreen() {
    Get.toNamed(AppRoutes.imgScreen);
  }

  void goToProductScreen() {
    Get.toNamed(AppRoutes.productScreen);
  }

  void goToCartScreen() {
    Get.toNamed(AppRoutes.cartScreen);
  }

  void goToLoginScreen() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  void goToWishlistScreen() {
    Get.toNamed(AppRoutes.wishlistScreen);
  }
}
