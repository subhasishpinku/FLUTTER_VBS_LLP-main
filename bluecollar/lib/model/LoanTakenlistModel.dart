import 'package:flutter/material.dart';
import 'package:get/get.dart';

List loantakenlistModel = [
  {
    "id": 1,
    "nums": "1",
    "date": "1/4/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 2,
    "nums": "2",
    "date": "2/5/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 3,
    "nums": "3",
    "date": "2/6/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 3,
    "nums": "3",
    "date": "2/6/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 4,
    "nums": "4",
    "date": "2/7/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 5,
    "nums": "5",
    "date": "2/8/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
  {
    "id": 6,
    "nums": "6",
    "date": "2/8/2022",
    "status": "Active",
    'icon': Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
          borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: Text(
          "Paid",
          style: TextStyle(color: Colors.white, fontSize: 8.0),
        ),
        onTap: () {
          Get.toNamed("SEARCH_PAGE");
        },
      ),
    ),
  },
];
