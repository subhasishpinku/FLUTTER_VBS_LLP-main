// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/controllers/enquiry_controller.dart';
import 'package:admin/models/enquiry_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnquiryList extends StatelessWidget {
  EnquiryList({Key? key}) : super(key: key);

  final EnquiryController enquiryController = Get.put(EnquiryController());

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
          rows: List.generate(enquiryModel.length, (index) {
            enquiryController.index.value;
            return recentUserDataRow(
              enquiryModel[index]['name'],
              enquiryModel[index]['email'],
              enquiryModel[index]['phoneNo'],
              enquiryModel[index]['date'],
              enquiryModel[index]['time'],
              enquiryModel[index]['replied'],
              enquiryModel[index]['icon'],
              enquiryModel[index],
            );
          }),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(var name, var email, var phoneNo, var date, var time,
    var replied, var icon, var index) {
  final EnquiryController enquiryController = Get.put(EnquiryController());
  return DataRow(
    onSelectChanged: (bool? selected) {
      // print(index);
      enquiryController.query.value.text = index['query'];
      enquiryController.photoUrl.value = index['img'];
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
