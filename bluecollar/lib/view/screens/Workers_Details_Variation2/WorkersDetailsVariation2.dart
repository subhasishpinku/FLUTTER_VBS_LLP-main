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

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class WorkersDetailsVariation2 extends StatelessWidget {
  WorkersDetailsVariation2({Key? key}) : super(key: key);
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
                  SizedBox(
                    width: 280,
                  ),
                  InkWell(
                    child: Image.asset(
                      "images/group_bars.png",
                      height: 60,
                      width: 40,
                    ),
                    onTap: (() {
                      actions:
                      <Widget>[
                        Obx(
                          () => PopupMenuButton<Menu>(
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<Menu>>[
                                    const PopupMenuItem<Menu>(
                                      value: Menu.itemOne,
                                      child: Text('Item 1'),
                                    ),
                                    const PopupMenuItem<Menu>(
                                      value: Menu.itemTwo,
                                      child: Text('Item 2'),
                                    ),
                                    const PopupMenuItem<Menu>(
                                      value: Menu.itemThree,
                                      child: Text('Item 3'),
                                    ),
                                    const PopupMenuItem<Menu>(
                                      value: Menu.itemFour,
                                      child: Text('Item 4'),
                                    ),
                                  ]),
                        )
                      ];
                    }),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: 363,
                    height: 151,
                    child: Image.asset(
                      "images/group81.png",
                      height: 60,
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                    child: Container(
                      width: 363,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(11),
                          bottomRight: Radius.circular(11),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Kamla (Age-30)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                            child: Text(
                              'Maid',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 7.0),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              SvgPicture.asset(
                                'images/users.svg',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sd1234',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'images/location.svg',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Nigdi, Pune',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 110,
                              ),
                              SvgPicture.asset(
                                'images/call.svg',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '9163752468',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 40,
                      child: Image.asset(
                        "images/group33.png",
                        height: 65,
                        width: 65,
                      ),
                    ),
                    right: 250,
                    left: 0,
                    bottom: 110,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 250,
              //   width: double.infinity,
              //   // width: 200,
              //   child: PageView.builder(
              //     controller: pageController,
              //     itemCount: homeController.demo.length,
              //     onPageChanged: (int index) {
              //       homeController.pageIndex.value = index;
              //     },
              //     itemBuilder: (BuildContext context, int index) {
              //       return FractionallySizedBox(
              //         widthFactor: 1 / pageController.viewportFraction,
              //         child: Container(
              //           child:
              //               homeController.demo[homeController.pageIndex.value],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var i = 0; i < 1; i++) homeCard(),
                    for (var i = 0; i < 1; i++) homeCard1(),
                    for (var i = 0; i < 1; i++) homeCard2(),
                    for (var i = 0; i < 1; i++) homeCard(),
                    for (var i = 0; i < 1; i++) homeCard1(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
