// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable

import 'package:bluecollar/components/text_field.dart';
import 'package:bluecollar/components/text_field3.dart';
import 'package:bluecollar/components/text_field4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WorkerPersonalDetails extends StatelessWidget {
  WorkerPersonalDetails({Key? key}) : super(key: key);
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
              Text(
                "Personal Details",
                style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              textfield("First Name ", prefixicon: Icons.person),
              SizedBox(
                height: 10,
              ),
              textfield("Last Name", prefixicon: Icons.person),
              SizedBox(
                height: 10,
              ),
              textfield3("Choose Gender",
                  prefixicon: Icons.male, suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              textfield("D.O.B", prefixicon: Icons.calendar_month),
              SizedBox(
                height: 10,
              ),
              textfield("Mobile Number", prefixicon: Icons.phone_android),
              SizedBox(
                height: 10,
              ),
              textfield("Current Address",
                  prefixicon: Icons.location_searching_outlined),
              SizedBox(
                height: 10,
              ),
              textfield("Permanent Address", prefixicon: Icons.location_on),
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
              SizedBox(
                height: 10,
              ),
              textfield("Enter First Name",
                  prefixicon: Icons.person_outline_outlined),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Last Name", prefixicon: Icons.person_outlined),
              SizedBox(
                height: 10,
              ),
              textfield("Mobile Number", prefixicon: Icons.phone_android),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Relation", prefixicon: Icons.family_restroom),
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onTap: () {
                        Get.toNamed('WORKER_GENERAL_DETAILS');
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
