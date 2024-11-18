// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/constants.dart';
import 'package:bluecollar/model/cardlistModel.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      width: 200,
      child: DataTable2(
        columnSpacing: defaultPadding,
        minWidth: 380,
        columns: [
          DataColumn(
            label: Text(""),
          ),
          DataColumn(
            label: Text(""),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: List.generate(
          cardlistModel.length,
          (index) => recentUserDataRow(
            cardlistModel[index]['img'],
            cardlistModel[index]['name'],
            cardlistModel[index]['icon'],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var img, var name, var icon) {
  return DataRow(
    cells: [
      DataCell(Image.asset(img)),
      DataCell(Text(name)),
      DataCell(Image.asset(icon)),
      // DataCell(icon),
    ],
  );
}
