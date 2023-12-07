import 'package:get/get.dart';
import 'package:getx_practice/screens/login_form/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}