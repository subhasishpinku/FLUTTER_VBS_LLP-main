// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/constants.dart';
import 'package:bluecollar/model/WageDetailsModel.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class WageDetailsList extends StatelessWidget {
  const WageDetailsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      width: 200,
      child: DataTable2(
        columnSpacing: defaultPadding,
        minWidth: 400,
        columns: [
          DataColumn(
            label: Text("Month"),
          ),
          DataColumn(
            label: Text("Wage"),
          ),
          DataColumn(
            label: Text("Status"),
          ),
          DataColumn(
            label: Text("Action"),
          ),
        ],
        rows: List.generate(
          wageDetailsModel.length,
          (index) => recentUserDataRow(
            wageDetailsModel[index]['month'],
            wageDetailsModel[index]['wage'],
            wageDetailsModel[index]['status'],
            wageDetailsModel[index]['icon'],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var month, var wage, var status, var icon) {
  return DataRow(
    cells: [
      DataCell(Text(month)),
      DataCell(Text(wage)),
      DataCell(Text(status)),
      DataCell(icon),
    ],
  );
}
