import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/cart/cart_controller.dart';
import 'package:getx_practice/screens/product/product_controller.dart';
import 'package:getx_practice/utils/constant.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    required this.productList,
  });

  var cartController = Get.find<CartController>();

  final List productList;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 2, color: Colors.grey, offset: Offset(0, 3))
                ],
              ),
              margin: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Image.network(
                            productList[index].image.toString(),
                            height: 120),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productList[index].title.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text('₹ ${productList[index].price.toString()}'),
                    ],
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.amberAccent,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 14, bottom: 14),
                    child: InkWell(
                      onTap: () {
                        print('index that click: ${productList[index].id}');

                        //SnackBar
                        Get.showSnackbar(GetSnackBar(
                          title: productList[index].title,
                          message: 'Added to cart',
                          duration: const Duration(seconds: 2),
                        ));

                        // Add data in new list
                        cartController.getClickedProductDataController(
                          productList[index].id!.toInt(),
                          productList[index].image.toString(),
                          productList[index].title.toString(),
                          productList[index].price!.toDouble(),
                        );
                      },
                      child: cartController
                              .isIdInCartList(productList[index].id!.toInt())
                          ? Container(
                              width: double.infinity,
                              child: const Text(
                                "Item Added to cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.orange),
                              ),
                            )
                          : Container(
                              height: 34,
                              width: 34,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.orange),
                                shape: BoxShape.rectangle,
                              ),
                              child: SvgPicture.asset(
                                addToCart,
                                fit: BoxFit.cover,
                                height: 14,
                                width: 14,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
