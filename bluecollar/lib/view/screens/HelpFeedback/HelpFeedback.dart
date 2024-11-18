// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/customerListCard.dart';
import 'package:bluecollar/components/text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HelpFeedbackPage extends StatelessWidget {
  HelpFeedbackPage({Key? key}) : super(key: key);
  TextEditingController textarea = TextEditingController();
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
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 100,
                    ),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      "199K Reviews",
                      style: TextStyle(color: Colors.black, fontSize: 8.0),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Text(
                "  Feedback",
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 363,
                height: 93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19),
                    topRight: Radius.circular(19),
                    bottomLeft: Radius.circular(19),
                    bottomRight: Radius.circular(19),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: TextField(
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Share your thought",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                          borderRadius: BorderRadius.circular(25.0)),
                      child: InkWell(
                        child: Text(
                          "Agree",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        onTap: () {
                          // Get.toNamed(toName!);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 92,
                      height: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0XFFFC4A1A),
                          ),
                          borderRadius: BorderRadius.circular(18)),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                                color: Color(0XFFFC4A1A), fontSize: 12.0),
                          ),
                        ),
                        onTap: () {
                          Get.toNamed('PAYMENT_UPDATE_SUCCESSFULLY');
                        },
                      ),
                    ),
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
