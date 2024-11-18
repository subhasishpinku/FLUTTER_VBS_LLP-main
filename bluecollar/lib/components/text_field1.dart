import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget textfield1(String label, {IconData? prefixicon, IconData? suffixicon}) {
  return SizedBox(
    height: 80,
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Color.fromRGBO(255, 255, 255, 1),
        filled: true,
        prefixIcon: Icon(prefixicon),
        // SvgPicture.asset(
        //   prefixicon!,
        //   // height: 10,
        // ),
        suffixIcon: Icon(suffixicon),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(255, 255, 255, 1), width: 0.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
