// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable

import 'package:bluecollar/components/text_field.dart';
import 'package:bluecollar/components/text_field3.dart';
import 'package:bluecollar/components/text_field4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WorkersGeneralDetails extends StatelessWidget {
  WorkersGeneralDetails({Key? key}) : super(key: key);
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
                "General Details",
                style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Job Description ", prefixicon: Icons.work),
              SizedBox(
                height: 10,
              ),
              textfield3("Select Tasks ",
                  suffixicon: Icons.expand_more,
                  prefixicon: Icons.task_outlined),
              SizedBox(
                height: 10,
              ),
              textfield3("Type Of Id",
                  prefixicon: Icons.manage_accounts_outlined,
                  suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              textfield("Date of Joining", prefixicon: Icons.calendar_month),
              SizedBox(
                height: 10,
              ),
              textfield("Salary per month", prefixicon: Icons.money_sharp),
              SizedBox(
                height: 10,
              ),
              textfield3("Mode Of Payment",
                  prefixicon: Icons.payment, suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              textfield3("Select Working Days In A Week",
                  prefixicon: Icons.work_history,
                  suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              textfield3("Number Of Paid Leaves In A Month",
                  prefixicon: Icons.leave_bags_at_home_sharp,
                  suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              textfield3("Number Of Hours Worked",
                  prefixicon: Icons.home_max_outlined,
                  suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      textfield4("From Time",
                          suffixicon: Icons.expand_more,
                          prefixicon: Icons.watch_later_outlined),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      textfield4("To Time",
                          suffixicon: Icons.expand_more,
                          prefixicon: Icons.watch_later_outlined),
                    ],
                  ),
                ],
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onTap: () {
                        Get.toNamed('WORKER_TAB_CONTROLLER');
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
