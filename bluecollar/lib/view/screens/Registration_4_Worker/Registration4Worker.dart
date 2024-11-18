// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable

import 'package:bluecollar/components/text_field.dart';
import 'package:bluecollar/components/text_field3.dart';
import 'package:bluecollar/components/text_field4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Registration4WorkerPage extends StatelessWidget {
  Registration4WorkerPage({Key? key}) : super(key: key);
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
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/date_of_births.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Date Of Birth  ',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("26-11-1994", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/mobile_number.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mobile Number',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("9163752468", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/locations1.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Permanent Address',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Nigdi, Pune", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/locations1.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Current Address',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Nigdi, Pune", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Text(
                "Emergency Contact",
                style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/user_name.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'First Name',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter First Name", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/user_name.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Last Name',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Last Name", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/mobile_view.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mobile Number',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("9163752468", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/mobile_view.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Relation',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Uncle", suffixicon: Icons.expand_more),
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
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onTap: () {
                        // Get.toNamed(toName!);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
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
                          "Back",
                          style: TextStyle(
                              color: Color(0XFFFC4A1A), fontSize: 12.0),
                        ),
                      ),
                      onTap: () {
                        Get.toNamed('TAB_CONTROLLER_PAGE');
                      },
                    ),
                  ),
                ],
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
