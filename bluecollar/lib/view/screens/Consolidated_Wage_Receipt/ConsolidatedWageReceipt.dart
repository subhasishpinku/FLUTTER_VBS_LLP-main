// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bluecollar/components/homeCard.dart';
import 'package:bluecollar/components/homeCard1.dart';
import 'package:bluecollar/components/homeCard2.dart';
import 'package:bluecollar/controller/home_controller.dart';
import 'package:bluecollar/controller/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConsolidatedWageReceipt extends StatelessWidget {
  ConsolidatedWageReceipt({Key? key}) : super(key: key);
  final pageController = PageController(viewportFraction: 1.05);
  final HomeController homeController = Get.put(HomeController());
  final TabBarController tabBarController = Get.find<TabBarController>();
  final List<IconData> iconList = [
    Icons.home,
    Icons.person,
    Icons.description,
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
      //       print(tabBarController.currentIndex.value);
      //       tabBarController.currentIndex.value = value;
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
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(2, 4),
                            blurRadius: 12),
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Center(
                      child: InkWell(
                        child: SvgPicture.asset(
                          'images/arrow_back.svg',
                          width: 20,
                          height: 20,
                        ),
                        onTap: (() {}),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 280,
                  // ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 20.0),
              //   height: 220,
              //   child: ListView(
              //     // This next line does the trick.
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       for (var i = 0; i < 1; i++) homeCard(),
              //       for (var i = 0; i < 1; i++) homeCard1(),
              //       for (var i = 0; i < 1; i++) homeCard2(),
              //       for (var i = 0; i < 1; i++) homeCard(),
              //       for (var i = 0; i < 1; i++) homeCard1(),
              //     ],
              //   ),
              // ),
              Container(
                width: 366,
                height: 100,
                padding: EdgeInsets.fromLTRB(25, 19, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Worker Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Maid",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE1D3),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0XFFE98952),
                                    ),
                                    child: Image.asset(
                                      'images/Worker1.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.topLeft,
                                          children: <Widget>[
                                            Image.asset("images/worker11.png"),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  "Employers",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  "12",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFDBF4F0),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0XFF37C384),
                                    ),
                                    child: Image.asset(
                                      'images/worker2.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.topLeft,
                                          children: <Widget>[
                                            Image.asset("images/worker22.png"),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  "Employers",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  "9,000",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFBD6FB),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0XFF9F55F5),
                                    ),
                                    child: Image.asset(
                                      'images/worker3.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.topLeft,
                                          children: <Widget>[
                                            Image.asset("images/worker33.png"),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  "Loan Repayment",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  "1,200",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFDBF4F0),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0XFF44B3E0),
                                    ),
                                    child: Image.asset(
                                      'images/worker4.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.topLeft,
                                          children: <Widget>[
                                            Image.asset("images/worker44.png"),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  "Loan Outstanding",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  "1,900",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(38.0, 14.0, 38.0, 14.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: InkWell(
                    // child: Text(
                    //   '',
                    //   style: TextStyle(color: Colors.white, fontSize: 16.0),
                    // ),
                    child: Image.asset('images/downloads.png'),
                    onTap: () {
                      Get.toNamed('EMLOYEE_WAGE_RECEIPT');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
