// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/models/order_history_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class OrderHistorList extends StatelessWidget {
  const OrderHistorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable2(
        columnSpacing: defaultPadding,
        minWidth: 600,
        columns: [
          DataColumn(
            label: Text("Buyer"),
          ),
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("Date"),
          ),
          DataColumn(
            label: Text("Email"),
          ),
          DataColumn(
            label: Text("Phone Number"),
          ),
        ],
        rows: List.generate(
          orderHistoryModel.length,
          (index) => recentUserDataRow(
            orderHistoryModel[index]['buyer'],
            orderHistoryModel[index]['name'],
            orderHistoryModel[index]['date'],
            orderHistoryModel[index]['buyerEmail'],
            orderHistoryModel[index]['buyerPhoneNumber'],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(
    var buyer, var name, var date, var buyerEmail, var buyerPhoneNumber) {
  return DataRow(
    cells: [
      DataCell(Text(buyer)),
      DataCell(Text(name)),
      DataCell(Text(date)),
      DataCell(Text(buyerEmail)),
      DataCell(Text(buyerPhoneNumber)),
    ],
  );
}
