import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/routes/app_routes.dart';

import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/home_screen/home_controller.dart';
import 'package:getx_practice/screens/photos/img_controller.dart';
import 'package:getx_practice/screens/post/post_controller.dart';
import 'package:getx_practice/screens/product/product_controller.dart';
import 'package:getx_practice/utils/loader.dart';
import 'package:getx_practice/widget/appdrawer.dart';

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
      appBar: AppBar(title: Text('Main Screen'.tr)),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            // Post data button
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInQuart,
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: value * 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        Utils.showLoader();
                        postController.reinitializePostController();
                        if (postController.postList.isEmpty) {
                          print('List Is Empty');
                          await postController.fetchPostDataController();
                        }
                        await postController.fetchPostDataController();
                        Get.back();
                        homeController.goToPostScreen();
                      },
                      child: Text('Fetch Data'.tr),
                    ),
                  ),
                );
              },
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
              child: Text('Fetch Image Data'.tr),
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
                  child: Text('Product List'.tr),
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
                  child: Text('Cart List'.tr),
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
              child: Text('Wish List'.tr),
            ),
            // login validation
            const SizedBox(width: 18),
            ElevatedButton(
              onPressed: () {
                // homeController.goToLoginScreen();
                Get.toNamed(AppRoutes.loginScreen,
                    arguments: "This is Login Screen");
              },
              child: Text('Login Page'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
