import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/dependency_injection.dart';
import 'package:getx_practice/localization/localization_data.dart';

import 'package:getx_practice/routes/app_page.dart';
import 'package:getx_practice/routes/app_routes.dart';
import 'package:getx_practice/screens/home_screen/home_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      initialRoute: AppRoutes.homeScreen,
      initialBinding: HomeBinding(),
      getPages: AppPage.getPage,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
    );
  }
}
