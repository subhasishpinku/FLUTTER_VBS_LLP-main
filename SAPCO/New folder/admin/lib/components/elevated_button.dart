import 'package:flutter/material.dart';

Widget elevatedButton(BuildContext context, {required String label, required Color color, Function()? onPressed}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }