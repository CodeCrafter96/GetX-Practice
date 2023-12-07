import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/login_form/login_controller.dart';

class LoginScreeen extends StatelessWidget {
  LoginScreeen({super.key});

  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Form'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    child: Text(
                      Get.arguments,
                    ),
                  ),
                  Obx(() {
                    print(
                        'rebuild TextFormField ${loginController.errorText.value}');
                    return TextFormField(
                      onChanged: loginController.emailChanged,
                      decoration: InputDecoration(
                          labelText: 'email',
                          errorText: loginController.errorText.value),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        loginController.validations(value!);
                      },
                    );
                  }),
                  // Obx(() {
                  //   print(
                  //       'rebuild TextFormField ${loginController.errorText.value}');
                  //   return TextFormField(
                  //     onChanged: loginController.passwordChanged,
                  //     decoration: InputDecoration(
                  //         hintText: "Entere password",
                  //         errorText: loginController.errorText.value),
                  //   );
                  // }),
                ],
              ),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: loginController.submitFunc.value,
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
