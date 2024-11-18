// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/constants.dart';
import 'package:bluecollar/model/LoanTakenlistModel.dart';
import 'package:bluecollar/model/WageDetailsModel.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class LoanTakenList extends StatelessWidget {
  const LoanTakenList({Key? key}) : super(key: key);
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
            label: Text("Number"),
          ),
          DataColumn(
            label: Text("Date"),
          ),
          // DataColumn(
          //   label: Text("Status"),
          // ),
          DataColumn(
            label: Text("Action"),
          ),
        ],
        rows: List.generate(
          loantakenlistModel.length,
          (index) => recentUserDataRow(
            loantakenlistModel[index]['nums'],
            loantakenlistModel[index]['date'],
            // loantakenlistModel[index]['status'],
            loantakenlistModel[index]['icon'],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var nums, var date, var icon) {
  return DataRow(
    cells: [
      DataCell(Text(nums)),
      DataCell(Text(date)),
      // DataCell(Text(status)),
      DataCell(icon),
    ],
  );
}
