// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/individual_user_component.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/models/user_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: defaultPadding,
                    right: defaultPadding,
                    left: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(title: "User"),
                    SizedBox(height: defaultPadding),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 125.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                offset: Offset(
                                  15.0,
                                  15.0,
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    childAspectRatio:
                                        Responsive.isDesktop(context)
                                            ? (1 / .26)
                                            : Responsive.isTablet(context)
                                                ? (1 / .1)
                                                : (1 / .30),
                                    crossAxisCount:
                                        Responsive.isDesktop(context) ? 2 : 1,
                                    crossAxisSpacing: 50,
                                    mainAxisSpacing:
                                        Responsive.isDesktop(context)
                                            ? 0
                                            : Responsive.isTablet(context)
                                                ? 5
                                                : 10,
                                    children: [
                                      individualUserComponent(context,
                                          name: "Name", label: "Name", textInputType: TextInputType.name),
                                      individualUserComponent(context,
                                          name: "Joined", label: "Joined Date", textInputType: TextInputType.name),
                                      individualUserComponent(context,
                                          name: "Email", label: "Email", textInputType: TextInputType.name),
                                      individualUserComponent(context,
                                          name: "Phone Number",
                                          label: "Phone Number", textInputType: TextInputType.name),
                                      individualUserComponent(context,
                                          name: "Calls Made",
                                          label: "Total Calls Made", textInputType: TextInputType.name),
                                      individualUserComponent(context,
                                          name: "Last Active",
                                          label: "Last Active", textInputType: TextInputType.name),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Subscription packages",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 300,
                                  child: DataTable2(
                                    columnSpacing: defaultPadding,
                                    minWidth: 600,
                                    columns: [
                                      DataColumn(
                                        label: Text("Name"),
                                      ),
                                      DataColumn(
                                        label: Text("Date"),
                                      ),
                                      DataColumn(
                                        label: Text("Status"),
                                      ),
                                      DataColumn(
                                        label: Text("Action"),
                                      ),
                                    ],
                                    rows: List.generate(
                                      users[0]['packages'].length,
                                      (index) => recentUserDataRow(
                                        context,
                                        users[0]['packages'][index]['name'],
                                        users[0]['packages'][index]['date'],
                                        users[0]['packages'][index]['status'],
                                        users[index]['icon'],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(
    BuildContext context, var name, var date, var status, var icon) {
  return DataRow(
    cells: [
      DataCell(Text(name)),
      DataCell(Text(date)),
      DataCell(
        Text(
          status,
          style: TextStyle(
            color: status == "pending"
                ? Colors.amber
                : status == "recieved"
                    ? Colors.green
                    : status == "shipped"
                        ? Colors.blue
                        : Colors.red,
          ),
        ),
      ),
      DataCell(
        Responsive.isDesktop(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Deactivate",
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Delete",
                    ),
                  ),
                ],
              )
            : InkWell(
                onTap: () {
                  showDialogWithFields(context);
                },
                child: icon,
              ),
      ),
    ],
  );
}

showDialogWithFields(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () => {},
            child: Text('Deactivate'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {},
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}
