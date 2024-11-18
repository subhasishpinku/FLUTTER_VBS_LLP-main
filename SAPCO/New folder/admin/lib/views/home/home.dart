// ignore_for_file: prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:admin/components/header.dart';
import 'package:admin/controllers/dashboard_controller.dart';
import 'package:admin/views/grid_section/grid_section.dart';
import 'package:admin/views/recent/recent_calls_made.dart';
import 'package:admin/views/recent/recent_subs.dart';
import 'package:admin/views/recent/recent_subs_sold.dart';
import 'package:admin/views/recent/recent_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/responsive.dart';
import '../active_subscriptions/active_subscriptions.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: true,
        padding: EdgeInsets.all(defaultPadding),
        child: Obx(
          () => Column(
            children: [
              Header(title: "Dashboard"),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        GridSection(),
                        SizedBox(height: defaultPadding),
                        dashBoardController.index.value == 0
                            ? RecentUsers()
                            : dashBoardController.index.value == 1
                                ? RecentSubs()
                                : dashBoardController.index.value == 2
                                    ? RecentSubsSold()
                                    : RecentCallsMade(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) ActiveSubscriptions(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: ActiveSubscriptions(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
