// ignore_for_file: prefer_const_constructors

import 'package:carsewa/components/home_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // carousel
  RxInt pageIndex = 0.obs;
  List<Widget> demo = [
    homeCard(),
    homeCard(),
    homeCard(),
    homeCard(),
    homeCard(),
  ];

  // bottom navigation
  
}
