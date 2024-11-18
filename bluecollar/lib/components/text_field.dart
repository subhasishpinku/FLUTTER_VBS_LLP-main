import 'package:flutter/material.dart';

Widget textfield(String label, {IconData? prefixicon, IconData? suffixicon}) {
  return SizedBox(
    height: 80,
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Color.fromRGBO(255, 255, 255, 1),
        filled: true,
        prefixIcon: Icon(prefixicon),
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
