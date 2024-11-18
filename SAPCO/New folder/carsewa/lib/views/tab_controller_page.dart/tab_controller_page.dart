// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carsewa/controllers/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControllerPage extends StatelessWidget {
  final TabBarController tabBarController = Get.find<TabBarController>();

  TabControllerPage({Key? key}) : super(key: key);

  final List<IconData> iconList = [
    Icons.home,
    // Icons.category,
    // Icons.notifications,
    Icons.person,
    Icons.more_horiz,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          // elevation: 10,
          height: 70,
          iconSize: 30,
          backgroundColor: Color(0xFF162248),
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          icons: iconList,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          activeIndex: tabBarController.currentIndex.value,
          gapLocation: GapLocation.none,
          onTap: (value) {
            tabBarController.currentIndex.value = value;
          },
        ),
      ),
      body: Obx(
        () => tabBarController.pages[tabBarController.currentIndex.value],
      ),
    );
  }
}
