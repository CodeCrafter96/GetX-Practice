import 'package:get/get.dart';
import 'package:getx_practice/routes/app_routes.dart';
import 'package:getx_practice/screens/cart/cart_binding.dart';
import 'package:getx_practice/screens/cart/cart_screen.dart';
import 'package:getx_practice/screens/home_screen/home_binding.dart';
import 'package:getx_practice/screens/home_screen/home_screen.dart';
import 'package:getx_practice/screens/photos/image_binding.dart';
import 'package:getx_practice/screens/photos/img_screen.dart';
import 'package:getx_practice/screens/post/post_binding.dart';
import 'package:getx_practice/screens/post/post_screen.dart';
import 'package:getx_practice/screens/product/product_binding.dart';
import 'package:getx_practice/screens/product/product_screen.dart';

class AppPage {
  static final List<GetPage> getPage = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.imgScreen,
      page: () => ImgScreen(),
      binding: ImgBinding(),
    ),
    GetPage(
      name: AppRoutes.postScreen,
      page: () => PostScreen(),
      binding: PostBinding(),
    ),
    GetPage(
      name: AppRoutes.productScreen,
      page: () => ProductScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
  ];
}
