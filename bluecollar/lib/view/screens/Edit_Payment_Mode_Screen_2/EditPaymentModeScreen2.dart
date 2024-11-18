// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:bluecollar/components/card_list.dart';
import 'package:bluecollar/components/constants.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/home_controller.dart';
import 'package:bluecollar/controller/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class EditPaymentModeScreen2 extends StatelessWidget {
  EditPaymentModeScreen2({Key? key}) : super(key: key);
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
  // List<String> iconNames = <String>[
  //   'images/home.svg',
  //   'images/home.svg',
  //   'images/home.svg',
  // ];
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
    final List<String> items = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    String? selectedValue;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Select Methods",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              // Container(
              //   width: 380,
              //   padding: EdgeInsets.all(defaultPadding),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(9),
              //       topRight: Radius.circular(9),
              //       bottomLeft: Radius.circular(9),
              //       bottomRight: Radius.circular(9),
              //     ),
              //     color: Color.fromRGBO(255, 255, 255, 1),
              //   ),
              //   child: SizedBox(
              //     height: 380,
              //     child: CardList(),
              //   ),
              // ),
              Container(
                width: 363,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/cash.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Cash",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/cheque.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Cheque",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/net_banking.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Net Banking",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/google_pay.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Google Pay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/phone_pe.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Phone pe",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('images/paytm.png'),
                          SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              "Paytm",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Image.asset('images/arrowes.png'),
                          SizedBox(
                            width: 23,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: primaryButton(
                  context,
                  label: "SAVE",
                  toName: "",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("TAB_CONTROLLER_PAGE");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
