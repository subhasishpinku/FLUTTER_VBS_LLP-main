// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable

import 'package:bluecollar/components/text_field.dart';
import 'package:bluecollar/components/text_field3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Registration2WorkerPage extends StatelessWidget {
  Registration2WorkerPage({Key? key}) : super(key: key);
  int _selectedIndex = 0;
  bool? check1 = false,
      check2 = false,
      check3 = false,
      check4 = false,
      check5 = false,
      check6 = false,
      check7 = false,
      check8 = false,
      check9 = false,
      check10 = false,
      check11 = false,
      check12 = false,
      check13 = false,
      check14 = false,
      check15 = false,
      check16 = false,
      check17 = false,
      check18 = false,
      check19 = false,
      check20 = false;
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
                  SvgPicture.asset('images/dateofjoin.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Date Of Joining  ',
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
              textfield("2022-04-20"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/salary_pay_month.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Salary Per Month',
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
              textfield("8000"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  // SvgPicture.asset('images/dob.svg'),
                  SvgPicture.asset('images/mode_of_payment.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mode Of Payment',
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
              textfield3("Google Pay", suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              Text(
                'This feature is for individuals who hire domestic workers for a maximum of 4 days a week',
                style: new TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                  width: Get.width - 16,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "Working Days during The Week:",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check1, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Monday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check2, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Tuesday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check3, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Wednesday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check4, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Thursday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check5, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Friday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check6, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Saturday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check7, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Sunday")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                  width: Get.width - 16,
                  height: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "Weekly Offs:",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check8, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Monday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check9, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Tuesday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check10, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Wednesday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check11, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Thursday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check12, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Friday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check13, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Saturday")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check14, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Sunday")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check15, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("No Off")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check16, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("O2W (Once in 2 Weeks)"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                  width: Get.width - 16,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "Weeks:",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check17, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Week 1")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check18, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Week 2")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check19, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Week 3")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  //only check box
                                  value: check20, //unchecked
                                  onChanged: (bool? value) {}),
                              Text("Week 4")
                            ],
                          ),
                        ],
                      ),
                      //
                    ],
                  ),
                ),
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
                  // SvgPicture.asset('images/gender.svg'),
                  SvgPicture.asset('images/week_days.svg'),
                  SizedBox(
                    width: 15,
                  ),

                  Text(
                    'Which day of the Week for O2W',
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
              textfield3("Sunday", suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
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
                      Get.toNamed('REGISTRATION3_WORKER');
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
