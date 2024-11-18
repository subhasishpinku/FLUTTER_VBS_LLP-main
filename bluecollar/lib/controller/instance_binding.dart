// ignore_for_file: prefer_const_constructors

import 'package:bluecollar/controller/tab_controller.dart';
import 'package:bluecollar/view/screens/worker_tab_controller_page/WorkerTabControllerPage.dart';
import 'package:get/get.dart';

class InstanceBinding implements Bindings {
  @override
  void dependencies() {
     Get.put<TabBarController>(TabBarController());
     Get.put<WorkerTabControllerPage>(WorkerTabControllerPage());
  }
}
