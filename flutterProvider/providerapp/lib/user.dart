import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String email = "";
  String pwd = "";

  void signIn(String userEmail, String userPwd) {
    email = userEmail; // Assign the parameter value to the class field
    pwd = userPwd; // Assign the parameter value to the class field
    notifyListeners();
  }
}
