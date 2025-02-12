import 'package:flutter/material.dart';

Widget otpInput(
    BuildContext context, TextEditingController? controller, bool? autoFocus) {
  return SizedBox(
    height: 40,
    width: 40,
    child: TextField(
      autofocus: autoFocus!,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: controller,
      maxLength: 1,
      cursorColor: Theme.of(context).primaryColor,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
