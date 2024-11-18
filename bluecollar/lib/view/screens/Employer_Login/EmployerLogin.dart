// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/create_text_field1.dart';
import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/controller/authentication_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployerLogin extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  EmployerLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Employer',
      'Worker',
    ];
    String? selectedValue;
    RxBool isEmpolyer = false.obs;
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
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(' Are you an employer?'),
                  InkWell(
                    child: Text('Create an Account',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                    onTap: () {
                      Get.toNamed("SIGNUP");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Log in as'),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            // Icon(
                            //   Icons.list,
                            //   size: 16,
                            //   color: Colors.black,
                            // ),
                            // SizedBox(
                            //   width: 4,
                            // ),
                            Expanded(
                              child: Text(
                                'Employer',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          // setState(() {
                          //   selectedValue = value as String;
                          // });
                          print(value.toString());
                          if (value.toString() == "Employer") {
                            Get.toNamed('TAB_CONTROLLER_PAGE');
                          } else {
                            Get.toNamed('WORKER_TAB_CONTROLLER');
                          }
                        },
                        icon: const Icon(
                          Icons.expand_more,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 40,
                        buttonWidth: 150,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ),
                ],
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
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      onTap: () {
                        authenticationController.password.clear();
                        authenticationController.email.clear();
                        Get.toNamed("FORGOT_PASSWORD");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: primaryButton(
                  context,
                  label: "LOGIN",
                  toName: "TAB_CONTROLLER_PAGE",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("TAB_CONTROLLER_PAGE");
                  },
                ),
              ),
              SizedBox(
                height: 30,
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
