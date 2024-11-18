import 'package:flutter/material.dart';
import 'package:flutterproviderapi/provider/todo_provider.dart';
import 'package:flutterproviderapi/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
