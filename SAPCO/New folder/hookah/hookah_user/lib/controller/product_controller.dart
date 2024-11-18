import 'package:get/get.dart';

class ProductController extends GetxController {
  final number = 1.obs;
  final isLoading = false.obs;

  void increment() {
    number.value++;
    isLoading.value = !isLoading.value;
    update();
  }
}
