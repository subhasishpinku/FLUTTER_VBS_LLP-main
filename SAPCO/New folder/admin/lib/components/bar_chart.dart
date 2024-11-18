// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:admin/controllers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget({Key? key}) : super(key: key);

  final List<DataItem> _myData = List.generate(
    10,
    (index) => DataItem(
      x: index * 10,
      y1: Random().nextInt(5) + Random().nextDouble(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 3
            : MediaQuery.of(context).size.width,
        height: 200,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
                border: Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            )),
            groupsSpace: 10,
            barGroups: _myData
                .map(
                  (dataItem) => BarChartGroupData(
                    x: dataItem.x,
                    barRods: [
                      BarChartRodData(
                          y: dataItem.y1, width: 15, colors: [Colors.blue]),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class DataItem {
  int x;
  double y1;

  DataItem({required this.x, required this.y1});
}
