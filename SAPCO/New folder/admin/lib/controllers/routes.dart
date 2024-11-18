// ignore_for_file: prefer_const_constructors

import 'package:admin/views/advertisements/advertisements.dart';
import 'package:admin/views/content_management/content_management.dart';
import 'package:admin/views/coupons/coupons.dart';
import 'package:admin/views/enquiry/enquiry.dart';
import 'package:admin/views/help_and_support/help_and_support.dart';
import 'package:admin/views/home/home.dart';
import 'package:admin/views/login/login.dart';
import 'package:admin/views/notifications/notifications.dart';
import 'package:admin/views/order_history/order_history.dart';
import 'package:admin/views/subscriptions/subscriptions.dart';
import 'package:admin/views/users/individual_user.dart';
import 'package:admin/views/users/users.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/main_screen/main_screen.dart';

List<GetPage> getPages = [
  GetPage(name: "/DASHBOARD", page: () => DashBoard()),
  GetPage(name: "/MAIN_SCREEN", page: () => MainScreen()),
  GetPage(name: "/LOGIN", page: () => Login()),
  GetPage(name: "/ORDER_HISTORY", page: () => OrderHistory()),
  GetPage(name: "/USERS", page: () => Users()),
  GetPage(name: "/USER", page: () => User()),
  GetPage(name: "/SUBSCRIPTIONS", page: () => Subscriptions()),
  GetPage(name: "/CONTENT_MANAGEMENT", page: () => ContentManagement()),
  GetPage(name: "/HELP_AND_SUPPORT", page: () => HelpAndSupport()),
  GetPage(name: "/COUPONS", page: () => Coupons()),
  GetPage(name: "/ENQUIRY", page: () => Enquiry()),
  GetPage(name: "/NOTIFICATIONS", page: () => Notifications()),
  GetPage(name: "/ADVERTISEMENTS", page: () => Advertisement()),
  // Advertisement
];
