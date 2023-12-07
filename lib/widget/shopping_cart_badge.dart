import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/cart/cart_screen.dart';
import 'package:getx_practice/utils/loader.dart';

class ShoppingCartBadge extends StatelessWidget {
  ShoppingCartBadge({super.key});

  // var cartController = Get.find<CartController>();

  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return badges.Badge(
        showBadge: true,
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: const badges.BadgeAnimation.slide(
          disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.red,
        ),
        badgeContent: Text(
          cartController.cartList.length.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () async{
             Utils.showLoader();
                    await cartController.loadCartFromStorage();
                    Get.back();
            Get.to(() => CartScreen());
          },
        ),
      );
    });
  }
}
