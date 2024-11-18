import 'package:carsewa/controllers/tab_controller.dart';
import 'package:get/get.dart';

class InstanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TabBarController>(TabBarController());
  }
}
