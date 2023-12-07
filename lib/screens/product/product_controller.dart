import 'package:get/get.dart';
import 'package:getx_practice/data/model/product_model/product_model.dart';
import 'package:getx_practice/data/services/product_services.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;

  var productList = <ProductModel>[].obs;

  fetchProductDataController() async {
    try {
      isLoading(true);
      var data = await FetchProductDataAPI().fetchProductData();
      var productData =
          data.map((json) => ProductModel.fromJson(json)).toList();
      print("this is product data : ${productData}");
      productList.assignAll(productData);
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productList.clear();
    super.dispose();
  }
}
