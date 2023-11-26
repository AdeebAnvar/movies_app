import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/modules/search_screen/views/search_screen_view.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  BottomNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => screens[Get.find<BottomNavController>().currentIndex.value]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Colors.red.shade800,
          useLegacyColorScheme: true,
          currentIndex: Get.find<BottomNavController>().currentIndex.value,
          onTap: (index) => Get.find<BottomNavController>().onChnagePage(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        );
      }),
    );
  }

  final List<Widget> screens = [
    const HomeView(),
    const SearchScreenView(),
  ];
}
