// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/create_text_field1.dart';
import 'package:bluecollar/components/otp_input.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerCreateNewPasswordPin extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  EmployerCreateNewPasswordPin({Key? key}) : super(key: key);
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F9),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash_screen1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  "images/logo.png",
                  height: 100,
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Center(
                child: Container(
                  width: 323,
                  height: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      "Enter Pincode",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        otpInput(context, _fieldOne, true),
                        otpInput(context, _fieldTwo, false),
                        otpInput(context, _fieldThree, false),
                        otpInput(context, _fieldFour, false),
                      ],
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Center(
                      child: primaryButton(
                        context,
                        label: "Submit",
                        toName: "EMPLOYER_LOGIN",
                        onPressed: () async {
                          // await saveLogin();
                          // await saveRegistration(context);
                          // Get.toNamed("TAB_CONTROLLER_PAGE");
                        },
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
