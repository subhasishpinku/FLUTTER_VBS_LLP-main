// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget homeCard() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Color(0xFFB6F1F7),
      borderRadius: BorderRadius.circular(
        20,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Buy Subscription",
          style: TextStyle(
            color: Color(0xFF162248),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Purchase your',
                    style: TextStyle(
                      color: Color(0xFF162248),
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' QR\nCode',
                        style: TextStyle(
                          color: Color(0xFF162248),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Buy Now"),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.arrow_forward_outlined)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/home_card.png"),
          ],
        ),
      ],
    ),
  );
}
