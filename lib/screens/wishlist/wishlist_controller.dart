import 'package:get/get.dart';
import 'package:getx_practice/data/model/product_model/product_model.dart';
import 'package:getx_practice/data/storage/local_storage.dart';

class WishlistController extends GetxController {
  var wishlist = <ProductModel>[].obs;
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

    addToWishlist();
    wishlistBox.write(
        'wishlist', wishlist.map((product) => product.toJson()).toList());
  }

  // Add data to wish list
  void addToWishlist() {
    ProductModel newProduct = ProductModel(
      id: idData,
      image: imageData,
      title: titleData,
      price: priceData,
    );
    wishlist.add(newProduct);
  }

  // Check product is already in wish list
  bool isIdInWishList(int targetId) {
    if (wishlist.any((product) => product.id == targetId)) {
      return true;
    }
    return false;
  }

  loadCartFromStorage() {
    List<dynamic>? storedCart = box.read('wishlist');
    if (storedCart != null) {
      list.assignAll(
        storedCart.map((item) => ProductModel.fromJson(item)).toList(),
      );
    }

    print("wish list: ${list.length}");
  }

  void saveCartToStorage() {
    box.write('wishlist', wishlist.toList());
  }
}
