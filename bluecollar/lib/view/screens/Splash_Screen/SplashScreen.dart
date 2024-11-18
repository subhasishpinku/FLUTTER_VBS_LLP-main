// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
       Get.offAllNamed("EMPLOYER_LOGIN");
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "images/blue_color_splash.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                // await printKeyHash();
              },
              child: Image.asset(
                "images/logo.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}

// printKeyHash() async {
//   String? key = await FlutterFacebookKeyhash.getFaceBookKeyHash ??
//       'Unknown platform version';
//   print(key);
// }
