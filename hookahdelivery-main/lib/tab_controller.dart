import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hookah/view/screen/home.dart';
import 'package:hookah/view/screen/notification_page.dart';
import 'package:hookah/view/screen/profile_page.dart';

class TabControllerPage extends StatefulWidget {
  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  // String argument = Get.arguments ?? 'deliveryList';
  int currentPage = 0;
  Map page = {
    'home': Home(),
    'profile': const ProfilePage(),
    'notification': const NotificationPage()
  };

  List<IconData> iconList = [
    Icons.home,
    Icons.person,
    Icons.notifications,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          activeColor: const Color(0xff020D4D),
          inactiveColor: Colors.grey,
          icons: iconList,
          leftCornerRadius: 30,
          rightCornerRadius: 30,
          activeIndex: currentPage,
          gapLocation: GapLocation.none,
          // notchSmoothness: NotchSmoothness.softEdge,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          }
          //other params
          ),

      //  BottomNavigationBar(
      //   currentIndex: currentPage,
      //   onTap: (value) {
      //     setState(() {
      //       currentPage = value;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications), label: 'notification'),
      //   ],
      // ),
      body: page.values.toList()[currentPage],
    );
  }
}
