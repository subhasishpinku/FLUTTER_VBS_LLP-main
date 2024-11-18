// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carsewa/components/vehicle_list_card.dart';
import 'package:carsewa/controllers/home_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  final pageController = PageController(viewportFraction: 1.05);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lorem Ipsum"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              // homeCard(),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: homeController.demo.length,
                  onPageChanged: (int index) {
                    homeController.pageIndex.value = index;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FractionallySizedBox(
                      widthFactor: 1 / pageController.viewportFraction,
                      child: Container(
                        child:
                            homeController.demo[homeController.pageIndex.value],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Center(
                  child: DotsIndicator(
                    decorator: DotsDecorator(
                      activeColor: Color(0xFF162248),
                    ),
                    dotsCount: homeController.demo.length,
                    position: homeController.pageIndex.value.toDouble(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Lorem Ipsum",
                style: TextStyle(
                  color: Color(0xFF162248),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              for (var i = 0; i < 10; i++) vehicleListCard(),

              // ListView.separated(
              //   separatorBuilder: (context, index) {
              //     return SizedBox(height: 20);
              //   },
              //   shrinkWrap: true,
              //   itemCount: 10,
              //   itemBuilder: (BuildContext context, int index) {
              //     return vehicleListCard();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
