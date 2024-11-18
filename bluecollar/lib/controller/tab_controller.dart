import 'package:bluecollar/view/screens/Home_page/HomePage.dart';
import 'package:bluecollar/view/screens/Notification/Notification.dart';
import 'package:bluecollar/view/screens/Report/report.dart';
import 'package:bluecollar/view/screens/profile/profile.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  RxInt currentIndex = 0.obs;
  List pages = [
    HomePage(),
    ProfilePage(),
    ReportPage(),
    NotificationPage(),
  ];
}
