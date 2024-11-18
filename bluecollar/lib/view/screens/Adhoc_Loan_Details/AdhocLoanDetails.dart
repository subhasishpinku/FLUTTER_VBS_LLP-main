// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AdhocLoanDetailsPage extends StatelessWidget {
  AdhocLoanDetailsPage({Key? key}) : super(key: key);
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
              Text(
                'Loan Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              for (var i = 0; i < 10; i++) attendence_table(),
              SizedBox(
                height: 20,
              ),
              textfield("Partial Payment"),
              SizedBox(
                height: 20,
              ),
              textfield("Outstanding Amount"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 366,
                height: 137,
                child: TextField(
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Waive off Loan (Reason)',
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1), width: 0.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
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
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      Get.toNamed('EMILOAN_DETAILS');
                    },
                  ),
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

Widget attendence_table() {
  return Row(
    children: [
      Expanded(
        child: Container(
          // height: 219,
          // width: 100,
          color: Color(0xFFFEF5DA),
          child: Table(border: TableBorder.all(), children: [
            TableRow(children: [
              Center(child: Text("Jane Doe")),
            ]),
          ]),
        ),
      ),
      Expanded(
        child: Container(
          // height: 219,
          // width: 100,
          color: Color(0xFFFFFFFF),
          child: Table(border: TableBorder.all(), children: [
            TableRow(children: [
              Center(child: Text("Loan No.2")),
            ]),
          ]),
        ),
      ),
    ],
  );
}
