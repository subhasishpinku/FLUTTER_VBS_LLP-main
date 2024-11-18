// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/models/user_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable2(
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
            label: Text("Calls Made"),
          ),
          DataColumn(
            label: Text("Last Active"),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: List.generate(
          users.length,
          (index) => recentUserDataRow(
            users[index]['title'],
            users[index]['email'],
            users[index]['phoneNo'],
            users[index]['callsMade'],
            users[index]['lastActive'],
            users[index]['icon'],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var title, var email, var phoneNo, var callsMade,
    var lastActive, var icon) {
  return DataRow(
    cells: [
      DataCell(
        Text(title),
      ),
      DataCell(
        Text(email),
      ),
      DataCell(
        Text(phoneNo),
      ),
      DataCell(
        Text(callsMade),
      ),
      DataCell(
        Text(lastActive),
      ),
      DataCell(
        InkWell(
            onTap: () {
              Get.toNamed("USER");
            },
            child: icon),
      ),
    ],
  );
}
