import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/routes/app_page.dart';
import 'package:getx_practice/routes/app_routes.dart';
import 'package:getx_practice/screens/home_screen/home_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      initialBinding: HomeBinding(),
      getPages: AppPage.getPage,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),/
    );
  }
}
