// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/create_text_field1.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/authentication_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployerCreateAccount extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  EmployerCreateAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
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
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text('Already have an account?'),
                  Text('Log in',
                      style: TextStyle(
                        color: Colors.red,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              createdTextField1(
                preIcon: const Icon(Icons.person),
                // image: 'images/email.svg',
                isPassword: false,
                label: 'Your Name',
                keyboardType: TextInputType.name,
                controller: authenticationController.name,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                }),
              ),
              SizedBox(
                height: 10,
              ),
              createdTextField1(
                prefixText: "+91 - ",
                preIcon: const Icon(Icons.phone_android),
                isPassword: false,
                keyboardType: TextInputType.phone,
                label: 'Phone Number',
                controller: authenticationController.phoneNo,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your mobile number";
                  }
                  if (!authenticationController.isValidMobile(value)) {
                    return "Please enter a valid phone Number";
                  }
                  return null;
                }),
              ),
              SizedBox(
                height: 10,
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
                height: 10,
              ),
              Row(
                children: [
                  Container(
                      height: 70,
                      width: 170,
                      child: Obx(
                        () => createdTextField1(
                          // image: 'images/password.svg',
                          preIcon: const Icon(Icons.password),
                          isPassword: true,
                          label: 'Password',
                          controller: authenticationController.password,
                          validator: ((String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your passsord';
                            }
                            if (value.length < 4) {
                              return 'Please enter atleat 5 caracters';
                            }
                            return null;
                          }),
                        ),
                      )),
                  Container(
                      height: 70,
                      width: 170,
                      child: Obx(
                        () => createdTextField1(
                          // image: 'images/password.svg',
                          preIcon: const Icon(Icons.password),
                          isPassword: true,
                          label: 'Confirm Password',
                          controller: authenticationController.password,
                          validator: ((String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your passsord';
                            }
                            if (value.length < 4) {
                              return 'Please enter atleat 5 caracters';
                            }
                            return null;
                          }),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: primaryButton(
                  context,
                  toName : "EMPLOYER_LOGIN",
                  label: "Register",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("TAB_CONTROLLER_PAGE");
                    Get.toNamed("EMPLOYER_LOGIN");
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: '--------',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Or continue with',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '--------'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Image.asset('images/fb.png'),
                    onTap: () async {
                      // await authenticationController.signInWithGoogle();
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Image.asset('images/google.png'),
                    onTap: () async {
                      // await authenticationController.signInWithFacebook();
                    },
                  ),
                  // googlesignin
                  // facebook signin
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
