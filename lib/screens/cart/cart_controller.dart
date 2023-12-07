import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/data/model/product_model/product_model.dart';
import 'package:getx_practice/data/storage/local_storage.dart';

class CartController extends GetxService {
  var cartList = <ProductModel>[].obs;
  var list = <ProductModel>[].obs;
  int idData = 0;
  String imageData = "";
  String titleData = "";
  double priceData = 0.0;

  getClickedProductDataController(
      int id, String img, String title, double price) async {
    idData = id;
    imageData = img;
    titleData = title;
    priceData = price;

    addToCartList();
    box.write('cartList', cartList.map((product) => product.toJson()).toList());
    print("Added to cartList: $cartList");
    print("this is local list : ${box.read('cartList')}");
  }

  void addToCartList() {
    ProductModel newProduct = ProductModel(
      id: idData,
      image: imageData,
      title: titleData,
      price: priceData,
    );
    cartList.add(newProduct);
  }

  bool isIdInCartList(int targetId) {
    return cartList.any((product) => product.id == targetId);
  }

   loadCartFromStorage() {
    List<dynamic>? storedCart = box.read('cartList');
    if (storedCart != null) {
      list.assignAll(
        storedCart.map((item) => ProductModel.fromJson(item)).toList(),
      );
    }

    print("cart list: ${list.length}");
  }

  void saveCartToStorage() {
    box.write('cartList', cartList.toList());
  }
}
