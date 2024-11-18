import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:sreelethers_admin/Widgets/Utilities/drawer.dart';
import 'package:sreelethers_admin/Widgets/selling_products.dart';
import 'package:sreelethers_admin/Widgets/withdraw_request_table.dart';
import 'dart:math' as math;

import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "customerMessage"),
              icon: Icon(Icons.mail, color: Colors.white),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "orders"),
              icon: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            IconButton(
              onPressed: null,
              icon: PopupMenuButton<int>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("digistag@gmail.com"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Settings"),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("Sign Out"),
                  ),
                ],
                onCanceled: () {
                  print("You have canceled the menu.");
                },
                onSelected: (value) {
                  print(value);

                  switch (value) {
                    case 1:
                      break;
                    case 2:
                      break;
                    case 3:
                      Navigator.pushReplacementNamed(context, "login");
                      break;
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Icon(Icons.image, color: Colors.white),
              ),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Container(
            child: ListView(padding: EdgeInsets.all(10), children: [
          card("TOTAL ORDERS"),
          card("DELIVERED"),
          card("RETURNED"),
          card("FAILED"),
          SizedBox(height: 25),
          montlyEarning(),
          SellingProduts(),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10),
            child: Text("Withdraw Request Table",
                style: TextStyle(
                    fontSize: fontSize(context, 20),
                    color: AppColors.iconColor)),
          ),
          WithdrawRequestTable()
        ])));
  }

  Widget card(title) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        child: ListTile(
            title: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.title)),
            subtitle: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("9", style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: 3),
                    Container(
                      decoration: BoxDecoration(
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(.7),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(7),
                      child: Text("Jan - Dec",
                          style: TextStyle(color: AppColors.white)),
                    )
                  ],
                )),
            trailing: Container(
                height: 100,
                width: 100,
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      SplineAreaSeries<SalesData, DateTime>(
                          dataSource: <SalesData>[
                            SalesData('Jan', 20),
                            SalesData('Feb', 50),
                            SalesData('Mar', 10),
                            SalesData('Apr', 78),
                            SalesData('May', 47),
                            SalesData('June', 54),
                            SalesData('July', 86),
                            SalesData('Aug', 63),
                            SalesData('Sep', 35),
                            SalesData('Oct', 18),
                            SalesData('Nov', 86),
                            SalesData('Dec', 54),
                          ],
                          xValueMapper: (SalesData sales, _) => DateTime.now(),
                          yValueMapper: (SalesData sales, _) => sales.sales),
                    ]))));
  }

  Widget montlyEarning() {
    return Container(
        child: SfCartesianChart(
            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Jan', 20),
                SalesData('Feb', 50),
                SalesData('Mar', 10),
                SalesData('Apr', 78),
                SalesData('May', 47),
                SalesData('June', 54),
                SalesData('July', 86),
                SalesData('Aug', 63),
                SalesData('Sep', 35),
                SalesData('Oct', 18),
                SalesData('Nov', 86),
                SalesData('Dec', 54),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
