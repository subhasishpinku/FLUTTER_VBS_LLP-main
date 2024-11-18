import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContentManagementController extends GetxController {
  RxInt index = 0.obs;
  Rx<TextEditingController> contentTextController = TextEditingController().obs;



  RxString aboutText = "About text".obs;
  RxString privacyPolicyText = "Privacy Policy text".obs;
  RxString howItWorksText = "How it works text".obs;
  RxString termsText = "Terms text".obs;
}
