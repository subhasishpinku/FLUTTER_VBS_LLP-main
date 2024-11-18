import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order #100005",
                  style: TextStyle(
                      color: AppColors.title,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            customerInfo(),
            SizedBox(height: 25),
            orderInfo()
          ],
        ),
      ),
    );
  }

  customerInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          Align(
            alignment: Alignment.topRight,
            child: Text("Payment Method: ",
                style: TextStyle(color: AppColors.title)),
          )
        ],
      ),
    );
  }

  orderInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          Align(
            alignment: Alignment.topRight,
            child: Text("Payment Method: ",
                style: TextStyle(color: AppColors.title)),
          )
        ],
      ),
    );
  }
}
