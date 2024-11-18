import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HelpAndSupportController extends GetxController {
  RxInt index = 0.obs;

  Rx<TextEditingController> query = TextEditingController().obs;
  Rx<TextEditingController> reply = TextEditingController().obs;
}
