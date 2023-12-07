import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/product/product_controller.dart';
import 'package:getx_practice/widget/product_widget.dart';
import 'package:getx_practice/widget/shopping_cart_badge.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 24),
            child: ShoppingCartBadge(),
          ),
        ],
      ),
      body: ProductWidget(productList: productController.productList,),
    );
  }
}
