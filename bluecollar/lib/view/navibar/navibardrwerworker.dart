// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bluecollar/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawerWorker extends StatelessWidget {
  const NavDrawerWorker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Color(0xFFFFFFFF),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                      width: 106,
                      height: 106,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 106,
                                height: 106,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/Ellipse16.png'),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(106, 106)),
                                ))),
                        // Positioned(
                        //     top: 76,
                        //     left: 76,
                        //     child: Container(
                        //         width: 30,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //           color: Color.fromRGBO(22, 34, 72, 1),
                        //           borderRadius: BorderRadius.all(
                        //               Radius.elliptical(30, 30)),
                        //         ))),
                        // Positioned(
                        //   top: 87.7557373046875,
                        //   left: 86,
                        //   child: SvgPicture.asset('assets/Vector.svg',
                        //       semanticsLabel: 'vector'),
                        // ),
                      ])),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'John Doc',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Johndoe03@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          menuContainer(
              icon: 'images/dashboard.svg',
              title: 'Dashboard',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('ABOUT_US');
              }),
          menuContainer(
              icon: 'images/empolyer.svg',
              title: 'Empolyer',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('WORKER_PERSONAL_DETAILS');
              }),
          menuContainer(
              icon: 'images/wage_details.svg',
              title: 'Wage Details',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('WORKER_WAGE_DETAILS');
              }),

          menuContainer(
              icon: 'images/leave_attendence.svg',
              title: 'Leave & Attendance',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('WORKER_LEAVE_ATTENDANCE');
              }),
          menuContainer(
              icon: 'images/wage_receipt.svg',
              title: 'Wage Receipt',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('CONSOLIDATED_WAGE_RECEIPT');
              }),
          menuContainer(
              icon: 'images/loan_details.svg',
              title: 'Loan Details',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('HELP_FEED_BACK');
              }),
          menuContainer(
              icon: 'images/about_us.svg',
              title: 'About Us',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('ABOUT_US');
              }),

          menuContainer(
              icon: 'images/setting.svg',
              title: 'Settings',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
              }),
          menuContainer(
              icon: 'images/tream.svg',
              title: 'Terms of Service & Privacy Policy',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('TERMS_OF_SERVICES');
              }),
          menuContainer(
              icon: 'images/faq.svg',
              title: 'FAQ',
              ontap: () {
                // Get.offAll(
                //   () => TabControllerPage(),
                // );
                Get.toNamed('FAQ_PAGE');
              }),
          // menuContainer(
          //     icon: Icons.help,
          //     title: 'Help',
          //     ontap: () {
          //       // Get.offAll(
          //       //   () => TabControllerPage(),
          //       // );
          //     }),
          SizedBox(
            height: 50,
          ),
          // button("Logout"),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(38.0, 14.0, 38.0, 14.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                  borderRadius: BorderRadius.circular(25.0)),
              child: InkWell(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                onTap: () {
                  Get.toNamed('LOGOUT_POPUP');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
