// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/Splash_Screen.svg',
            fit: BoxFit.fill,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/Logo_Car_sewa 1.png',
            ),
          ),
        ],
      ),
    );
  }
}
