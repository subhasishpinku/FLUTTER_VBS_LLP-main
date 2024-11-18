// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LeaveApprovedSuccessfullyPage extends StatelessWidget {
  LeaveApprovedSuccessfullyPage({Key? key}) : super(key: key);
  TextEditingController textarea = TextEditingController();
  int _selectedIndex = 0;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(child: Image.asset('images/review_added.png')),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 320,
                height: 242,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 54,
                  ),
                  Text(
                    'Congratulations!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your review is added.',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                  Text(
                    'Successfully',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: InkWell(
                          child: Text(
                            "Proceed",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onTap: () {
                             Get.toNamed('REGISTRATION1_WORKER');
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
