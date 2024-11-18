// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/customerListCard.dart';
import 'package:bluecollar/components/text_field.dart';
import 'package:bluecollar/components/text_field1.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class WageReceiptConfirmation extends StatelessWidget {
  WageReceiptConfirmation({Key? key}) : super(key: key);
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
              InkWell(
                child: Text(
                  'Delete Wage Confirmation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                onTap: () {
                  // Get.toNamed("WAGE_DETAILS");
                },
              ),
              SizedBox(
                height: 10,
              ),
              textfield1("Name", prefixicon: Icons.person),
              SizedBox(
                height: 10,
              ),
              textfield1("Date", prefixicon: Icons.calendar_month),
              SizedBox(
                height: 10,
              ),
              textfield1("Working Days", prefixicon: Icons.work),
              SizedBox(
                height: 10,
              ),
              textfield1("Absent Days", prefixicon: Icons.today),
              SizedBox(
                height: 10,
              ),
              textfield1("Unpaid Leave", prefixicon: Icons.payments),
              SizedBox(
                height: 10,
              ),
              textfield1("Paid Leave", prefixicon: Icons.payments),
              SizedBox(
                height: 10,
              ),
              textfield1("Days Worked", prefixicon: Icons.date_range),
              SizedBox(
                height: 10,
              ),
              textfield1("Outstanding Loan",
                  prefixicon: Icons.home_repair_service),
              SizedBox(
                height: 10,
              ),
              textfield1("Gross Wages", prefixicon: Icons.bento),
              SizedBox(
                height: 10,
              ),
              textfield1("Loan 1: (Due Amt: 1000)",
                  prefixicon: Icons.real_estate_agent),
              SizedBox(
                height: 10,
              ),
              textfield1("Net Wages", prefixicon: Icons.group),
              SizedBox(
                height: 10,
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
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      Get.toNamed('WORKER_ADDED_SUCCESSFULY');
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
}
