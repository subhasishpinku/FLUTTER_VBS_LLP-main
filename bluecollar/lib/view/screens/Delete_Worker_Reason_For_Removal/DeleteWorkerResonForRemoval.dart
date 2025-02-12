// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/controller/home_controller.dart';
import 'package:bluecollar/controller/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class DeleteWorkerResonForRemovalPage extends StatelessWidget {
  DeleteWorkerResonForRemovalPage({Key? key}) : super(key: key);
  final pageController = PageController(viewportFraction: 1.05);
  final HomeController homeController = Get.put(HomeController());
  final TabBarController tabBarController = Get.find<TabBarController>();

  RxBool isVisible = false.obs;
  RxBool isVisible1 = false.obs;
  RxBool isVisible2 = false.obs;
  RxBool isVisible3 = false.obs;
  String reasonforremoval = "Reason for removal?";
  String arethereanyloanspending = "Are there any loans pending?";
  String waiveoffloan = "Waive off loan";
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
  bool? check1 = false,
      check2 = false,
      check3 = false,
      check4 = false,
      check5 = false,
      check6 = false,
      check7 = false,
      check8 = false,
      check9 = false;
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
                  'Delete Worker',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                onTap: () {
                  // Get.toNamed("WAGE_DETAILS");
                },
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width - 50,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            color: Color(0xffFC4A1A),
                          ),
                        ),
                        Positioned(
                          left: 4,
                          // top: 1,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            width: Get.width - 50,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/maskk.png',
                                          height: 100,
                                          width: 100,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Jane Doe",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "Maid",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'images/users.svg'),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "sd12345",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'images/call.svg'),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "+91 9163752468",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 15,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star,
                                                    color: Colors.blue,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                Text(
                                                  '3.9 out of 5',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            child: SvgPicture.asset(
                                              'images/arrow.svg',
                                              width: 15,
                                              height: 15,
                                            ),
                                            onTap: () {
                                              Get.toNamed(
                                                  'DELETE_WORKER_SCREEN');
                                            }),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => isVisible.value == false
                    ? Reasonforremoval()
                    : Reasonforremoval1(reasonforremoval, isVisible),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => isVisible1.value == false
                    ? Arethereanyloanspending()
                    : Reasonforremoval1(arethereanyloanspending, isVisible1),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => isVisible2.value == false
                  ? Waiveoffloan()
                  : Reasonforremoval1(waiveoffloan, isVisible2)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 366,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Last working day?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFFFC4A1A),
                        ),
                      ),
                    ),
                    SvgPicture.asset('images/faq1.svg'),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(38.0, 14.0, 38.0, 14.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: InkWell(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      Get.toNamed('DELETE_WORKER_POPUP');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Waiveoffloan() {
    return Container(
      width: 366,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  'Waive off loan?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFFC4A1A),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 140,
              // ),
              InkWell(
                  onTap: () async {
                    isVisible2.value = !isVisible2.value;
                  },
                  child: SvgPicture.asset('images/faqs.svg')),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          CheckboxListTile(
            value: check8,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Yes"),
          ),
          CheckboxListTile(
            value: check9,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("No (Update Loan Manually)"),
          ),
        ],
      ),
    );
  }

  Widget Arethereanyloanspending() {
    return Container(
      width: 366,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  'Are there any loans pending?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFFC4A1A),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 100,
              // ),
              InkWell(
                  onTap: () async {
                    isVisible1.value = !isVisible1.value;
                  },
                  child: SvgPicture.asset('images/faqs.svg')),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          CheckboxListTile(
            //checkbox positioned at left

            value: check6,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Yes"),
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check7,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("No"),
          ),
        ],
      ),
    );
  }

  Widget Reasonforremoval1(
    String text,
    RxBool isVisibleValue,
  ) {
    return Container(
      width: 366,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),

              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFFC4A1A),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 160,
              // ),
              InkWell(
                  onTap: () async {
                    isVisibleValue.value = !isVisibleValue.value;
                  },
                  child: SvgPicture.asset('images/faq1.svg')),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Reasonforremoval() {
    return Container(
      width: 366,
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),

              Expanded(
                child: Text(
                  'Reason for removal?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFFC4A1A),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 160,
              // ),
              InkWell(
                  onTap: () async {
                    isVisible.value = !isVisible.value;
                  },
                  child: SvgPicture.asset('images/faqs.svg')),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check1,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Left without notice"),
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check2,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Better opportunities"),
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check3,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Personal"),
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check4,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Terminated"),
          ),
          CheckboxListTile(
            //checkbox positioned at left
            value: check5,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              // setState(() {
              //    check3 = value;
              // });
            },
            title: Text("Other (Specify)"),
          ),
        ],
      ),
    );
  }
}
