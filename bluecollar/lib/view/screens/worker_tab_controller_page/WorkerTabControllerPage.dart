// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bluecollar/controller/tab_controller.dart';
import 'package:bluecollar/controller/worker_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerTabControllerPage extends StatelessWidget {
  WorkerTabControllerPage({Key? key}) : super(key: key);
  final WorkerTabBarController workertabBarController = Get.put(WorkerTabBarController());
  final List<IconData> iconList = [
    Icons.home,
    // Icons.category,
    // Icons.notifications,
    Icons.person,
    Icons.receipt,
    Icons.notifications,
  ];
  List<String> iconNames = <String>[
    'images/home.svg',
    'images/home.svg',
    'images/home.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          // elevation: 10,
          height: 100,
          iconSize: 30,
          backgroundColor: Color.fromARGB(255, 247, 248, 250),
          activeColor: Colors.orange,
          inactiveColor: Colors.black,
          icons: iconList,
          leftCornerRadius: 40,
          rightCornerRadius: 40,
          activeIndex: workertabBarController.currentIndex.value,
          gapLocation: GapLocation.none,
          onTap: (value) {
            workertabBarController.currentIndex.value = value;
          },
        ),
      ),
      body: Obx(
        () => workertabBarController.pages[workertabBarController.currentIndex.value],
      ),
    );
  }
}
