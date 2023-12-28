import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/wishlist/wishlist_controller.dart';
import 'package:getx_practice/widget/product_card.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: cartController.wishlist.isEmpty
          ? const Center(
              child: Text('Wish list is empty'),
            )
          : ProductCard(
              cartList: cartController.wishlist,
            ),
    );
  }
}
