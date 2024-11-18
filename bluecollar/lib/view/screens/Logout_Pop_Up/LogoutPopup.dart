// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoutPopup extends StatelessWidget {
  LogoutPopup({Key? key}) : super(key: key);
  TextEditingController textarea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F9),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(child: Image.asset('images/log_out_logo.png')),
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
                    'Are you sure you',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'want to logout?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                            "Agree",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onTap: () {
                            // Get.toNamed('PRIVACY_POLICY');
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
                              "Proceed",
                              style: TextStyle(
                                  color: Color(0XFFFC4A1A), fontSize: 12.0),
                            ),
                          ),
                          onTap: () {
                            // Get.toNamed('PRIVACY_POLICY');
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
