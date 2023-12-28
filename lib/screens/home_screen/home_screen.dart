import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/routes/app_routes.dart';

import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/home_screen/home_controller.dart';
import 'package:getx_practice/screens/login_form/login_screen.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';
import 'package:getx_practice/screens/post/post_controller.dart';
import 'package:getx_practice/screens/product/product_controller.dart';
import 'package:getx_practice/screens/wishlist/wishlist_controller.dart';

import 'package:getx_practice/utils/loader.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final name = TextEditingController();
  var storage = GetStorage();

  final homeController = Get.find<HomeController>();
  final postController = Get.find<PostController>();
  final imageController = Get.find<ImageController>();
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  // final wishlistController = Get.find<WishlistController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: Column(
          children: [
            // Post data button
            ElevatedButton(
              onPressed: () async {
                Utils.showLoader();
                await postController.fetchPostDataController();
                Get.back();
                homeController.goToPostScreen();
              },
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 18),
            //Photos Button
            ElevatedButton(
              onPressed: () async {
                Utils.showLoader();
                await imageController.fetchImgDataController();
                Get.back();
                homeController.goToImageScreen();
              },
              child: const Text('Fetch Image data'),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Product List Button
                ElevatedButton(
                  onPressed: () async {
                    Utils.showLoader();
                    await productController.fetchProductDataController();
                    Get.back();
                    homeController.goToProductScreen();
                  },
                  child: const Text('Product List'),
                ),
                const SizedBox(width: 18),
                // Card List Button
                ElevatedButton(
                  onPressed: () async {
                    Utils.showLoader();
                    await cartController.loadCartFromStorage();
                    Get.back();
                    homeController.goToCartScreen();
                  },
                  child: const Text('Cart List'),
                ),
              ],
            ),
            // Wishlist
            ElevatedButton(
              onPressed: () async {
                Utils.showLoader();
                await cartController.loadWishlistFromStorage();
                Get.back();
                homeController.goToWishlistScreen();
              },
              child: const Text('Whishlist'),
            ),
            // login validation
            const SizedBox(width: 18),
            ElevatedButton(
              onPressed: () {
                // homeController.goToLoginScreen();
                Get.toNamed(AppRoutes.loginScreen,
                    arguments: "This is Login Screen");
              },
              child: const Text('Login Page'),
            ),
          ],
        ),
      ),
    );
  }
}
