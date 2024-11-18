import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah/view/screen/home.dart';
import 'package:hookah/view/screen/login_page.dart';
import 'package:hookah/view/screen/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF020D4D),
          ),
          canvasColor: const Color(0xffE5E5E5),
          textTheme: GoogleFonts.poppinsTextTheme(
              const TextTheme(titleMedium: TextStyle(fontSize: 20))),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          )),
      home: const LoginPage(),
      routes: {
        'home': (context) => Home(),
        'ProfilePage': (context) => const ProfilePage(),
      },
    );
  }
}
