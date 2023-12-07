import 'package:get/get_utils/src/get_utils/get_utils.dart';

mixin ValidationMixin {
  String? validatedEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the email address';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please enter valid email address';
    } else {
      return null;
    }
  }

  String? validatedPassword(String? value) {
    if (value == null || value.isEmpty || value.contains(' ')) {
      return 'Please enter your password';
    } else {
      return null;
    }
  }
}