import 'package:get/get.dart';
import 'package:getx_practice/data/model/product_model/product_model.dart';
import 'package:getx_practice/data/storage/local_storage.dart';

class CartController extends GetxService {
  var cartList = <ProductModel>[].obs;
  var list = <ProductModel>[].obs;
  var wishlist = <ProductModel>[].obs;

  RxBool isFavorite = false.obs;

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
  }

  getClickedWishlistDataController(
      int id, String img, String title, double price) async {
    idData = id;
    imageData = img;
    titleData = title;
    priceData = price;

    addToWishlist();

    wishlistBox.write(
        'wishlist', wishlist.map((product) => product.toJson()).toList());

    // print("Added to cartList: $wishlist");
    // print("this is local list : ${box.read('wishlist')}");
  }

  void addToCartList() {
    ProductModel newProduct = ProductModel(
      id: idData,
      image: imageData,
      title: titleData,
      price: priceData,
    );
    if (!cartList.any((element) => element.id == idData)) {
      cartList.add(newProduct);
    } else {
      print("Data is already availabel in wisglist");
      cartList.remove(newProduct);
      int existingIndex =
          cartList.indexWhere((element) => element.id == newProduct.id);
      cartList.removeAt(existingIndex);
    }
  }

  // Add data to wish list
  void addToWishlist() {
    ProductModel newProduct = ProductModel(
      id: idData,
      image: imageData,
      title: titleData,
      price: priceData,
    );
    if (!wishlist.any((element) => element.id == idData)) {
      wishlist.add(newProduct);
    } else {
      print("Data is already availabel in wisglist");
      wishlist.remove(newProduct);
      int existingIndex =
          wishlist.indexWhere((element) => element.id == newProduct.id);
      wishlist.removeAt(existingIndex);
    }
  }

  // Check product is already in cart list
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

// WishList
  loadWishlistFromStorage() {
    List<dynamic>? storedCart = box.read('wishlist');
    if (storedCart != null) {
      wishlist.assignAll(
        storedCart.map((item) => ProductModel.fromJson(item)).toList(),
      );
    }

    print("wish list: ${list.length}");
  }

  void saveWishlistToStorage() {
    box.write('wishlist', wishlist.toList());
  }

  // Check product is already in wish list
  // isIdInWishList(int targetId) {
  //   ProductModel newProduct = ProductModel(
  //     id: idData,
  //     image: imageData,
  //     title: titleData,
  //     price: priceData,
  //   );
  //   if (wishlist.any((product) => product.id == targetId)) {
  //     isFavorite.toggle();
  //   } else {
  //     wishlist.remove(newProduct.id == targetId);
  //   }
  // }

  bool isIdInWishList(int targetId) {
    if (wishlist.any((product) => product.id == targetId)) {
      print("data is already availabel. /");
      return true;
    }
    return false;
  }

  // bool toggleWishList(int productId) {
  //   ProductModel newProduct = ProductModel(
  //     id: idData,
  //     image: imageData,
  //     title: titleData,
  //     price: priceData,
  //   );
  //   if (!isIdInWishList(productId)) {
  //     wishlist.remove(productId);
  //   } else {
  //     wishlist.add(newProduct);
  //   }
  //   return wishlist.remove(productId);
  // }
}
