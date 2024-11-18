import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();

  String validationEmail = "admin@gmail.com";
  String validationPassword = "123456";

}