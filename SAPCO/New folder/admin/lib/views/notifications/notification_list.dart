// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/controllers/notification_controller.dart';
import 'package:admin/models/user_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends StatelessWidget {
  NotificationList({Key? key}) : super(key: key);

  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable2(
        showCheckboxColumn: true,
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
        ],
        rows: List.generate(users.length, (index) {
          return recentUserDataRow(
            users[index]['title'],
            users[index]['email'],
            users[index]['phoneNo'],
            users[index]['callsMade'],
            users[index]['lastActive'],
            users[index]['icon'],
            users[index],
          );
        }),
      ),
    );
  }
}

DataRow recentUserDataRow(var title, var email, var phoneNo, var callsMade,
    var lastActive, var icon, var index) {
  final NotificationController notificationController =
      Get.put(NotificationController());

  return DataRow(
    selected: notificationController.selectedList[index['userId']],
    onSelectChanged: (bool? selected) {
      print(index['userId']);
      notificationController.selectedList[index['userId']] = selected!;
      print(notificationController.selectedList[index['userId']]);
    },
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
    ],
  );
}
