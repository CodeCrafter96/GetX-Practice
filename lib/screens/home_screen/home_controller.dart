import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/data/storage/local_storage.dart';
import 'package:getx_practice/routes/app_routes.dart';
import 'package:getx_practice/widget/no_internet_found.dart';

class HomeController extends GetxController {
  RxString selectedLanguage = 'English'.obs;
  var isDark = false.obs;
  var isConnected = false;

  final Connectivity _connectivity = Connectivity();
  RxBool hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the selected language from GetStorage when the controller is initialized
    selectedLanguage.value = box.read('language') ?? 'English';

    // Check internet connection
    _connectivity.onConnectivityChanged.listen(_updateConnectivity);
  }

  void _updateConnectivity(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.to(() => NoInternetFound());

      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      Get.back(closeOverlays: true);
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  void goToPostScreen() {
    Get.toNamed(AppRoutes.postScreen);
  }

  void goToImageScreen() {
    Get.toNamed(AppRoutes.imgScreen);
  }

  void goToProductScreen() {
    Get.toNamed(AppRoutes.productScreen);
  }

  void goToCartScreen() {
    Get.toNamed(AppRoutes.cartScreen);
  }

  void goToLoginScreen() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  void goToWishlistScreen() {
    Get.toNamed(AppRoutes.wishlistScreen);
  }

  void setLanguage(String language) {
    selectedLanguage.value = language;
    languageBox.write('language', language);
  }

  void changeTheme(state) {
    if (state == true) {
      isDark.value = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDark.value = false;
      Get.changeTheme(ThemeData.light());
    }
  }
}
