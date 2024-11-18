import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:http/http.dart' as http;

class Abandoned extends StatefulWidget {
  static const routeName = 'abandoned';
  @override
  _AbandonedState createState() => _AbandonedState();
}

class _AbandonedState extends State<Abandoned> {
  bool isSwitched = false;
  bool _isLoading = false;
  String _chosenValue = "";
  var fetchData;
  int status = 0;

  Future<void> fetchOrder() async {
    try {
      _isLoading = true;
      final url = Uri.parse(
          'https://development.lifeproductions.in/sreelathers/api/admin/order/order-list/abandoned');

      final response = await http.get(url);
      if (response.statusCode == 201) {
        print(response.body);
        final data = json.decode(response.body);

        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Oops!'),
                content: Text(data['msg']),
              );
            });
      }
      setState(() {
        fetchData = json.decode(response.body);
      });
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('something went wrong'),
            );
          });
    }
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text("Pending Orders"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(15),
              // child: Column
              // (
              children: [
                Row(
                  children: [
                    Text(
                      "Pending Order List",
                      style: TextStyle(
                        color: AppColors.title,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize(context, 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // tableWidget(),
                Column(
                  children: this.table(),
                )
              ],
              // ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appBarColor,
        child: Icon(Icons.add),
        onPressed: null,
        focusColor: Color(int.parse("0xff397BFA")),
      ),
    );
  }

  List<Column> table() {
    List<Column> data = [];

    for (int index = 0; index < fetchData['orderList'].length; index++) {
      data.add(Column(children: [
        Card(
          elevation: 5,
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: EdgeInsets.all(10),
            title: Text(
              (index + 1).toString() +
                  "." +
                  " ${fetchData['orderList'][index]['customer_name']}",
              style: TextStyle(
                  color: AppColors.title, fontSize: fontSize(context, 20)),
            ),
            children: [
              Text(
                "Customer Name: ${fetchData['orderList'][index]['customer_name']}",
                style: TextStyle(
                    fontSize: fontSize(context, 24),
                    color: AppColors.title,
                    letterSpacing: 0.5),
              ),
              SizedBox(height: 15),
              Text("Date: ${fetchData['orderList'][index]['created_at']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.title,
                      fontSize: fontSize(context, 24))),
              SizedBox(height: 15),
              Text(
                  "Payment Status: ${fetchData['orderList'][index]['payment_status']}",
                  style: TextStyle(
                      fontSize: fontSize(context, 24),
                      fontWeight: FontWeight.w400,
                      color: AppColors.title)),
              SizedBox(height: 15),
              Text("Total: ₹${(fetchData['orderList'][index]['order_amount'])}",
                  style: TextStyle(
                      fontSize: fontSize(context, 24),
                      fontWeight: FontWeight.w400,
                      color: AppColors.title)),
              SizedBox(height: 15),
              Text(
                  "Order Status:${fetchData['orderList'][index]['order_status']}",
                  style: TextStyle(
                      fontSize: fontSize(context, 24),
                      fontWeight: FontWeight.w400,
                      color: AppColors.title)),
              // SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
                  // SizedBox(width: 10),
                  IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "orders-details"),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.title,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.receipt_long_rounded,
                          color: AppColors.title))
                ],
              )
            ],
          ),
        )
      ]));
    }
    return data;
  }
}
