import 'package:bluecollar/view/screens/Home_page/HomePage.dart';
import 'package:bluecollar/view/screens/Notification/Notification.dart';
import 'package:bluecollar/view/screens/Report/report.dart';
import 'package:bluecollar/view/screens/Worker_Employer_Profile/WorkerEmployerProfile.dart';
import 'package:bluecollar/view/screens/Worker_Home_Page/WorkerHomePage.dart';
import 'package:bluecollar/view/screens/profile/profile.dart';
import 'package:get/get.dart';

class WorkerTabBarController extends GetxController {
  RxInt currentIndex = 0.obs;
  List pages = [
    WorkerHomePage(),
    WorkerEmployerProfile(),
    WorkerHomePage(),
    WorkerHomePage(),
  ];
}
