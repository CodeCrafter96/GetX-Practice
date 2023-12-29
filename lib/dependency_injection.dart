import 'package:get/get.dart';
import 'package:getx_practice/screens/home_screen/home_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
