// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget notificationList() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Container(
              width: Get.width - 60,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: Color(0xffFC4A1A),
              ),
            ),
            Positioned(
              left: 4,
              // top: 1,
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: Get.width - 64,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Color.fromRGBO(242, 241, 248, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/maskk.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Loan Added",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  "A review for Meena Kumari has beenadded",
                                  style: TextStyle(fontSize: 8),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Mon at",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "8:15Pm",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // SvgPicture.asset(
                            //   'images/arrow.svg',
                            //   width: 15,
                            //   height: 15,
                            // ),
                            InkWell(
                              child: Icon(Icons.more_horiz),
                              onTap: () {
                                //action code when clicked
                                Get.toNamed('POPUP_LOANADDED_SUCCESSFULY');
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
