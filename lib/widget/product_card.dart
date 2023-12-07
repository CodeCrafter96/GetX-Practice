import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/data/storage/local_storage.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.cartList,
  });

  final List cartList;


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 2, color: Colors.grey, offset: Offset(0, 3))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    alignment: Alignment.topLeft,
                    child:
                        Image.network(cartList[index].image.toString(), height: 80),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            cartList[index].title.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Text('₹ ${cartList[index].price.toString()}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
