import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/shipping_list.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'dart:math' as math;

import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:sreelethers_admin/order/abandoned.dart';
import 'package:sreelethers_admin/order/cancelled.dart';
import 'package:sreelethers_admin/order/confirmed.dart';
import 'package:sreelethers_admin/order/delivered.dart';
import 'package:sreelethers_admin/order/failed.dart';
import 'package:sreelethers_admin/order/out_for_delivery.dart';
import 'package:sreelethers_admin/order/pending.dart';
import 'package:sreelethers_admin/order/processing.dart';
import 'package:sreelethers_admin/order/returned.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
          decoration: BoxDecoration(
              // color: Colors.white,
              ),
          child: Container(
              child: Row(children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  "https://sl.sapco.digital/public/assets/back-end/img/160x160/img1.jpg"),
            )
          ]))),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 25),
        child: text("ORDER MANAGEMENT", 1),
      ),
      ExpansionTile(
        childrenPadding: EdgeInsets.only(left: 25),
        expandedAlignment: Alignment.topLeft,
        title: text("Order", 0),
        children: [
          listTile("All", "orders"),
          listTile("Pending", Pending.routeName),
          listTile("Confirmed", Confirmed.routeName),
          listTile("Processing", Processing.routeName),
          listTile("Out For Delivery", OutForDelivery.routeName),
          listTile("Delivered", Delivered.routeName),
          listTile("Returned", Returned.routeName),
          listTile("Failed", Failed.routeName),
          listTile("Cancelled", Cancelled.routeName),
          listTile("Abandoned", Abandoned.routeName),
        ],
      ),
      Divider(),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 25),
        child: text("BUSINESS MANAGEMENT", 1),
      ),
      listTileMain("Customer List", "customer-list"),
      listTileMain("Product Reviews", "product-review"),
      listTileMain("Customer Message", "customer-message"),
      listTileMain("Support Ticket", "support-ticket"),
      listTileMain("Coupons", "coupon"),
      ExpansionTile(
        childrenPadding: EdgeInsets.only(left: 25),
        expandedAlignment: Alignment.topLeft,
        title: text("Business Settings", 0),
        children: [
          listTile("Mail Config", "mail-config"),
          listTile("Shipping List", ShippingList.routeName),
          listTile("Shipping Method", "shipping-method"),
          listTile("Payment Method", "payment-method"),
          listTile("FAQ", "faq"),
          listTile("About Us", "about-us"),
          listTile("Terms and Conditions", "terms-and-conditions"),
        ],
      ),
      Divider(),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 25),
        child: text("REPORT AND ANALYTICS", 1),
      ),
      ExpansionTile(
          childrenPadding: EdgeInsets.only(left: 25, bottom: 25),
          expandedAlignment: Alignment.topLeft,
          title: text("Report", 0),
          children: [
            listTile("Earning Report", "earning-report"),
            listTile("Order Report", "order-report"),
          ])
    ]));
  }

  Widget text(string, value) {
    return Text(
      string,
      style: TextStyle(
        fontSize: fontSize(context, 23),
        color: value == 1 ? Colors.black : AppColors.title,
        fontWeight: value == 1 ? FontWeight.bold : FontWeight.w400,
      ),
    );
  }

  // sub section in drawer
  Widget listTile(string, route) {
    return ListTile(
        title: Row(children: [
          Icon(
            Icons.circle,
            size: 10,
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(.9),
          ),
          SizedBox(width: 10),
          text(string, 0)
        ]),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }

  // sub section in drawer
  Widget listTileMain(string, route) {
    return ListTile(
        title: text(string, 0),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }
}
