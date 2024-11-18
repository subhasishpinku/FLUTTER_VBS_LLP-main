// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget customerListCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'John Doe',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(
        height: 5,
      ),
      RatingBar.builder(
        itemSize: 15,
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.blue,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Reviewed on 12 January 2022',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        '12 people found this helpful',
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
                borderRadius: BorderRadius.circular(25.0)),
            child: InkWell(
              child: Text(
                "Helpful",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {
                Get.toNamed('ADD_REVIEWS');
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Report',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
