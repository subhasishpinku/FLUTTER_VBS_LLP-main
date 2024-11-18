// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget leveAttendanceList() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Container(
      width: 366,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),

              Expanded(
                child: Text(
                  "Paid Leave",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 160,
              // ),
              SvgPicture.asset('images/faq1.svg'),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
