// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget individualUserComponent(BuildContext context,
    {required String name,
    required String label,
    TextInputType? textInputType,
    TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 40,
        // width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          controller: controller,
          keyboardType: textInputType,
          // controller: loginController.email,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 8, right: 8),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 14,
            ),
            // prefixIcon: Icon(
            //   Icons.person,
            // ),
            suffixStyle: TextStyle(color: Colors.green),
          ),
        ),
      ),
    ],
  );
}
