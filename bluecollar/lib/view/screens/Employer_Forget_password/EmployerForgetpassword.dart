// ignore_for_file: prefer_const_constructors

import 'package:bluecollar/components/create_text_field1.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerForgetpassword extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  EmployerForgetpassword({Key? key}) : super(key: key);
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
                height: 10,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  width: 250,
                  child: Text(
                      'Enter your email address to recieve a verification code')),
              SizedBox(
                height: 51,
              ),
              createdTextField1(
                preIcon: const Icon(Icons.mail),
                // image: 'images/email.svg',
                isPassword: false,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: authenticationController.email,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter an email";
                  }
                  if (!authenticationController.isValidEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                }),
              ),
              SizedBox(
                height: 106,
              ),
              Center(
                child: primaryButton(
                  context,
                  label: "Send",
                  toName: "NEW_PASSWORD",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("NEW_PASSWORD");
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
