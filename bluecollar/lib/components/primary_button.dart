// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

Widget primaryButton(BuildContext context,
    {String? label, String? toName, Function()? onPressed}) {
  return Container(
    padding: EdgeInsets.fromLTRB(38.0, 14.0, 38.0, 14.0),
    decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
        borderRadius: BorderRadius.circular(25.0)),
    child: InkWell(
      child: Text(
        label!,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      onTap: () {
        Get.toNamed(toName!);
      },
    ),
  );
}
