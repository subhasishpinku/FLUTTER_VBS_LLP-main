// ignore_for_file: prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:admin/controllers/login_controller.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [

              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 125.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  15.0,
                  15.0,
                ),
              )
            ],
          ),
          width: Responsive.isDesktop(context)
              ? 400
              : Responsive.isTablet(context)
                  ? 400
                  : MediaQuery.of(context).size.width - 60,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: loginController.email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Enter Email',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    prefixText: ' ',
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
              SizedBox(height: 30),
              TextField(
                obscureText: true,
                controller: loginController.passwd,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    hintText: 'Enter Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    prefixText: ' ',
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {
                    if (loginController.email.text !=
                        loginController.validationEmail) {
                      Fluttertoast.showToast(
                          msg: "Invalid email",
                          webPosition: "center",
                          toastLength: Toast.LENGTH_LONG);
                    } else if (loginController.passwd.text !=
                        loginController.validationPassword) {
                      Fluttertoast.showToast(
                          msg: "Invalid password",
                          webPosition: "center",
                          toastLength: Toast.LENGTH_LONG);
                    } else {
                      Get.toNamed("MAIN_SCREEN");
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
