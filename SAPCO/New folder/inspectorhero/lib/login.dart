import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatelessWidget {
  final String title;
  const MyLoginPage({required Key key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.red,

      ),
    );
  }
}