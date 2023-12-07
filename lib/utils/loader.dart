import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showLoader() {
    Get.dialog(
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Loading..."),
          ],
        ),
      ),
      barrierDismissible: false, // Prevent dismissing with a tap outside
    );
  }
}
