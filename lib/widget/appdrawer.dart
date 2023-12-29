import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/home_screen/home_controller.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isLanguageEnabled = false;
  // String selectedLanguage = 'English';
  List<String> languageOptions = ['Hindi', 'English'];
  var isDark = false;

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 60,
          ),
          ListTile(
            leading: Icon(Icons.language_sharp),
            title: Text('Translate'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return DropdownButton<String>(
                    padding: EdgeInsets.zero,
                    underline: Container(),
                    value: controller.selectedLanguage.value,
                    items: languageOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        controller.setLanguage(newValue!);

                        if (newValue == "Hindi") {
                          var locale = Locale('hi');
                          Get.updateLocale(locale);
                        } else if (newValue == "English") {
                          var locale = Locale('en');
                          Get.updateLocale(locale);
                        }
                      });
                    },
                  );
                }),
              ],
            ),
            onTap: () {
              Get.back(); // Close the drawer
            },
          ),
          Obx(() {
            return ListTile(
              leading: Icon(Icons.dark_mode),
              title: Row(
                children: [
                  const Text('Change Theme'),
                  const Spacer(),
                  Switch(
                    value: controller.isDark.value,
                    onChanged: (state) {
                      controller.changeTheme(state);
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.back(); // Close the drawer
              },
            );
          }),
        ],
      ),
    );
  }
}
