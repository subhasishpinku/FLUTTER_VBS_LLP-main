// ignore_for_file: prefer_const_constructors

import 'package:bluecollar/components/create_text_field1.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerCreateNewPassword extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  EmployerCreateNewPassword({Key? key}) : super(key: key);
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
                'Create New Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  width: 250,
                  child: Text(
                      'Your new password must be different from previously used password')),
              SizedBox(
                height: 30,
              ),
              Obx(
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
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => createdTextField1(
                  // image: 'images/password.svg',
                  preIcon: const Icon(Icons.password),
                  isPassword: true,
                  label: 'Confirm New Password',
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
              ),
              SizedBox(
                height: 81,
              ),
              Center(
                child: primaryButton(
                  context,
                  label: "Send",
                  toName: "NEW_PASSWORD_PIN",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("TAB_CONTROLLER_PAGE");
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
