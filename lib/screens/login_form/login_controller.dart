import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString email = RxString('');
  RxString password = RxString('');
  RxnString errorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  @override
  void onInit() {
    super.onInit();
    debounce<String>(email, password, time: const Duration(milliseconds: 500));
  }

  validations(String val) async {
    errorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        print('All validations passed, enable submit btn...');
        submitFunc.value = submitFunction();
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      errorText.value = 'min. 5 chars';
      return false;
    }
    return true;
  }

  void emailChanged(String val) {
    email.value = val;
  }

  void passwordChanged(String pass) {
    password.value = pass;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      await Future.delayed(
          const Duration(seconds: 1), () => print('Login Successfully'));
      return true;
    };
  }
}
