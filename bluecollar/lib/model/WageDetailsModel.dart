import 'package:flutter/material.dart';
import 'package:get/get.dart';

List wageDetailsModel = [
  {
    "id": 1,
    "month": "January",
    "wage": "3000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("EMPLOYER_WAGE_RECEIPT");
        },
      ),
    ),
  },
  {
    "id": 2,
    "month": "February",
    "wage": "4000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 3,
    "month": "March",
    "wage": "5000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 4,
    "month": "April",
    "wage": "6000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 5,
    "month": "May",
    "wage": "7000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 6,
    "month": "June",
    "wage": "8000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 7,
    "month": "July",
    "wage": "9000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 8,
    "month": "August",
    "wage": "2000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 9,
    "month": "September",
    "wage": "5000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 10,
    "month": "October",
    "wage": "7000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 11,
    "month": "November",
    "wage": "4000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
  {
    "id": 12,
    "month": "December",
    "wage": "12000",
    "status": "pending",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "View Receipt",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          // Get.toNamed(toName!);
        },
      ),
    ),
  },
];
