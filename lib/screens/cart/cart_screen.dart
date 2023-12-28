import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/widget/product_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cartController.list.isEmpty
          ? const Center(
              child: Text('Cart is empty'),
            )
          : ProductCard(
              cartList: cartController.list,
            ),
    );
  }
}
