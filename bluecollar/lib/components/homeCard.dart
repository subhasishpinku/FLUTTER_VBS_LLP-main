// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget homeCard() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFDBF4F0),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
              color: Color.fromRGBO(13, 176, 158, 1),
            ),
            child: Image.asset(
              'images/user_logo.png',
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Stack(alignment: Alignment.topLeft, children: <Widget>[
                Image.asset("images/profile_view.png"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Profile",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ])
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromRGBO(13, 176, 158, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'images/arrow_front.svg',
                  width: 10,
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
