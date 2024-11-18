import 'package:flutter/material.dart';

textFormField(controller, string) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        labelText: string,
        labelStyle: TextStyle(fontSize: 14.0),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        border: InputBorder.none),
    style: TextStyle(fontSize: 14.0),
  );
}

Widget saveButton(context, route) {
  return Container(
      // margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height / 11,
      width: double.infinity,
      child: ElevatedButton(
          child: Text("Save Changes", style: TextStyle(fontSize: 15)),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(int.parse("0xff397BFA"))),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white38)))),
          onPressed: () async {
            Navigator.pushNamed(context, "dashboard");
          }));
}
