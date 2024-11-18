// ignore_for_file: prefer_const_constructors

import 'package:admin/components/grid_card_info.dart';
import 'package:admin/controllers/dashboard_controller.dart';
import 'package:admin/models/calls_made_model.dart';
import 'package:admin/models/grid_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class GridCardBuilder extends StatelessWidget {
  GridCardBuilder({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: gridModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            dashBoardController.index.value = index;
            // print(dashBoardController.index.value);
            if (dashBoardController.index.value == 3) {
              // print(callsMadeModel[0]['dateAndTime'][0]);
            }
          },
          child: GridCard(
              title: gridModel[index]['title'],
              count: gridModel[index]['count'],
              svgSrc: gridModel[index]['svgSrc'],
              countLabel: gridModel[index]['countLabel'],
              color: gridModel[index]['color']),
        );
      },
    );
  }
}
