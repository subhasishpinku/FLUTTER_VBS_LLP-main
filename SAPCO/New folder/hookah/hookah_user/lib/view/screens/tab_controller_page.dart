import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hookah_user/view/screens/categories_page.dart';
import 'package:hookah_user/view/screens/home.dart';
import 'package:hookah_user/view/screens/notification_page.dart';
import 'package:hookah_user/view/screens/profile_page.dart';

class TabControllerPage extends StatefulWidget {
  TabControllerPage({Key? key}) : super(key: key);

  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  int _currentIndex = 0;

  List _pages = [
    HomePage(),
    CategoriesPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.category,
    Icons.notifications,
    Icons.person,
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
          activeIndex: _currentIndex,
          gapLocation: GapLocation.none,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          }
          //other params
          ),

      // BottomNavigationBar(
      //     onTap: ((value) {
      //       setState(() {
      //         _currentIndex = value;
      //       });
      //     }),
      //     currentIndex: _currentIndex,
      //     unselectedItemColor: Colors.grey,
      //     selectedItemColor: Colors.indigo,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.category), label: 'Category'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.notifications), label: 'Notification'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     ]),
      body: _pages[_currentIndex],
    );
  }
}
