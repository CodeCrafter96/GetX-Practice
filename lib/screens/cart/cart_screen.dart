import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/data/model/product_model/product_model.dart';
import 'package:getx_practice/data/storage/local_storage.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/widget/product_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  // var list = <ProductModel>[];
  var cartController = Get.find<CartController>();

  // List<dynamic> storedCart = box.read('cartList');


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
