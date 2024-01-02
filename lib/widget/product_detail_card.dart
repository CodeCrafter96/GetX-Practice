import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailCard extends StatelessWidget {
  ProductDetailCard({super.key});
  final Map<String, dynamic> args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String image = Get.parameters['image']!;
    String title = Get.parameters['title']!;
    String price = Get.parameters['price']!;
    String description = Get.parameters['description']!;
    String category = Get.parameters['category']!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.network(
              alignment: Alignment.center,
              image,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 54, 24, 0),
              child: SizedBox(
                // color: Colors.blueAccent,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
