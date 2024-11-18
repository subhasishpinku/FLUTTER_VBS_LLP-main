// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bluecollar/components/worker_list.dart';
import 'package:bluecollar/view/navibar/navibardrwer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PotentialWorkerDetailsPage extends StatelessWidget {
  PotentialWorkerDetailsPage({Key? key}) : super(key: key);
  final pageController = PageController(viewportFraction: 1.05);
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'KindaCode.com',
              contentPadding: const EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          onChanged: (value) {
            // do something
          },
        ),
      ),
      endDrawer: NavDrawer(),
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () async {
                      Get.toNamed('WAGE_RECEIPT_CONFIRMATION');
                    },
                    child: Image.asset('images/Search1.png')),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Search Worker",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  "By Name / Phone / Id",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ]),
        ),
      ),
    );

    // Center(child: Image.asset('images/Search1.png')));
  }
}
