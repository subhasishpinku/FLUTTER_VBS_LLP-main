import 'package:flutter/material.dart';
import 'package:sreeleathers/utill/color_resources.dart';

void showCustomSnackBar(String message, BuildContext context, {bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isError ? ColorResources.getRed(context) : Colors.green,
    content: Text(message),
  ));
}
