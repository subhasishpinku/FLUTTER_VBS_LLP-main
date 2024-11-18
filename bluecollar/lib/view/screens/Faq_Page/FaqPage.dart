// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/controller/home_controller.dart';
import 'package:bluecollar/controller/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class FaqPage extends StatelessWidget {
  FaqPage({Key? key}) : super(key: key);
  final pageController = PageController(viewportFraction: 1.05);
  final HomeController homeController = Get.put(HomeController());
  final TabBarController tabBarController = Get.find<TabBarController>();
  final List<IconData> iconList = [
    Icons.home,
    // Icons.category,
    // Icons.notifications,
    Icons.person,
    Icons.receipt,
    Icons.notifications,
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F9),
      // bottomNavigationBar: Obx(
      //   () => AnimatedBottomNavigationBar(
      //     // elevation: 10,
      //     height: 100,
      //     iconSize: 30,
      //     backgroundColor: Color.fromARGB(255, 247, 248, 250),
      //     activeColor: Colors.orange,
      //     inactiveColor: Colors.black,
      //     icons: iconList,
      //     leftCornerRadius: 40,
      //     rightCornerRadius: 40,
      //     activeIndex: tabBarController.currentIndex.value,
      //     gapLocation: GapLocation.none,
      //     onTap: (value) {
      //       tabBarController.currentIndex.value = value;
      //       // Obx(
      //       //   () => tabBarController.pages[tabBarController.currentIndex.value],
      //       // );
      //     },
      //   ),
      // ),
      bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(
                      'images/home_icon.svg',
                      color: Colors.black,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/user_icon.svg',
                      color: Colors.black,
                    ),
                    label: 'User'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/report_icon.svg',
                      color: Colors.black,
                    ),
                    label: 'Description'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/notification_icon.svg',
                      color: Colors.black,
                    ),
                    label: 'Notifications')
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              // onTap: _onItemTapped,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(2, 4),
                            blurRadius: 12),
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'images/arrow_back.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Text(
                  'About Us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                onTap: () {
                  // Get.toNamed("WAGE_DETAILS");
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 366,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'What is purpose of this application?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xFFFC4A1A),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        SvgPicture.asset('images/faqs.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here making it look like readable English ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 366,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'What is the benifits?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFFC4A1A),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    SvgPicture.asset('images/faqs.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 366,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'What data we have to share?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFFC4A1A),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    SvgPicture.asset('images/faqs.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 366,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'What is the privacy rule?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFFC4A1A),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    SvgPicture.asset('images/faqs.svg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
