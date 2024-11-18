import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EnquiryController extends GetxController {
  RxInt index = 0.obs;

  Rx<TextEditingController> query = TextEditingController().obs;
  Rx<TextEditingController> reply = TextEditingController().obs;

  RxString photoUrl = "assets/icons/Figma_file.svg".obs;
}
