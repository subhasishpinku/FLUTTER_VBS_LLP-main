// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/controllers/help_and_support_controller.dart';
import 'package:admin/models/query_model.dart';
import 'package:admin/models/user_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupportList extends StatelessWidget {
  HelpAndSupportList({Key? key}) : super(key: key);

  final HelpAndSupportController helpAndSupportController =
      Get.put(HelpAndSupportController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: DataTable2(
          showCheckboxColumn: false,
          columnSpacing: defaultPadding,
          minWidth: 600,
          columns: [
            DataColumn(
              label: Text("Name"),
            ),
            DataColumn(
              label: Text("Email"),
            ),
            DataColumn(
              label: Text("Phone number"),
            ),
            DataColumn(
              label: Text("Date"),
            ),
            DataColumn(
              label: Text("Time"),
            ),
            DataColumn(
              label: Text("Replied"),
            ),
            DataColumn(
              label: Text(""),
            ),
          ],
          rows: List.generate(queryModel.length, (index) {
            helpAndSupportController.index.value;
            return recentUserDataRow(
              queryModel[index]['name'],
              queryModel[index]['email'],
              queryModel[index]['phoneNo'],
              queryModel[index]['date'],
              queryModel[index]['time'],
              queryModel[index]['replied'],
              queryModel[index]['icon'],
              queryModel[index],
            );
          }),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var name, var email, var phoneNo, var date, var time,
    var replied, var icon, var index) {
  final HelpAndSupportController helpAndSupportController =
      Get.put(HelpAndSupportController());
  return DataRow(
    onSelectChanged: (bool? selected) {
      // print(index['query']);
      helpAndSupportController.query.value.text = index['query'];
    },
    cells: [
      DataCell(
        Text(name),
      ),
      DataCell(
        Text(email),
      ),
      DataCell(
        Text(phoneNo),
      ),
      DataCell(
        Text(date),
      ),
      DataCell(
        Text(time),
      ),
      DataCell(
        replied == true
            ? Text(
                "Replied",
                style: TextStyle(color: Colors.green),
              )
            : Text(
                "Not replied",
                style: TextStyle(color: Colors.red),
              ),
      ),
      DataCell(
        InkWell(
            onTap: () {
              // Get.toNamed("USER");
            },
            child: icon),
      ),
    ],
  );
}
