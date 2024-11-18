import 'package:bluecollar/controller/instance_binding.dart';
import 'package:bluecollar/controller/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlueColler',
      builder: EasyLoading.init(),
      initialBinding: InstanceBinding(),
      theme: ThemeData(fontFamily: 'Roboto'),
      // home: Login(),
      initialRoute: "SPLASH_SCREEN",
      // initialRoute: "TAB_CONTROLLER_PAGE",
      // initialRoute: "CONSOLIDATED_WAGE_RECEIPT",
      getPages: getPages,
    );
  }
}
