// ignore_for_file: prefer_const_constructors

import 'package:carsewa/views/home/home.dart';
import 'package:carsewa/views/splash/splash.dart';
import 'package:carsewa/views/tab_controller_page.dart/tab_controller_page.dart';
import 'package:get/route_manager.dart';

List<GetPage> getPages = [
  GetPage(name: "/SPLASH_SCREEN", page: () => SplashScreen()),
  GetPage(name: "/HOME", page: () => HomePage()),
  GetPage(name: "/TAB_CONTROLLER_PAGE", page: () => TabControllerPage()),
];
