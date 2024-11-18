import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/Reports/earning_report.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/Reports/order_report.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/about_us.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/customer_message.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/faq.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/mail_config.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/payment_method.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/product_review.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/shipping_list.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/shipping_method.dart';
import 'package:sreelethers_admin/Widgets/Business%20Setting/terms_and_conditions.dart';
import 'package:sreelethers_admin/Widgets/Profilepage.dart';
import 'package:sreelethers_admin/Widgets/Utilities/adandoned_list.dart';
import 'package:sreelethers_admin/Widgets/coupon.dart';
import 'package:sreelethers_admin/Widgets/customer_list.dart';
import 'package:sreelethers_admin/Widgets/dashboard.dart';
import 'package:sreelethers_admin/Widgets/login.dart';
import 'package:sreelethers_admin/Widgets/support_ticket.dart';
import 'package:sreelethers_admin/Widgets/support_ticket_chat.dart';
import 'package:sreelethers_admin/Widgets/view_customer_info.dart';
import 'package:sreelethers_admin/order/abandoned.dart';
import 'package:sreelethers_admin/order/cancelled.dart';
import 'package:sreelethers_admin/order/confirmed.dart';
import 'package:sreelethers_admin/order/delivered.dart';
import 'package:sreelethers_admin/order/failed.dart';
import 'package:sreelethers_admin/order/out_for_delivery.dart';
import 'package:sreelethers_admin/order/pending.dart';
import 'package:sreelethers_admin/order/processing.dart';
import 'package:sreelethers_admin/order/returned.dart';

import 'order/order_details.dart';
import 'order/order_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sree leathers',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            subtitle2: TextStyle(
                color: Color(int.parse(
                  "0xff7F87A7",
                )),
                letterSpacing: 2.5),
            bodyText1: TextStyle(
                color: Color(int.parse(
                  "0xff7F87A7",
                )),
                letterSpacing: 0.5),
            // headline6: TextStyle(color: Colors.white, fontSize: 13),
            headline5: TextStyle(color: Colors.white, fontSize: 13),
            caption: TextStyle(
                color: Color(int.parse(
                  "0xff7F87A7",
                )),
                letterSpacing: 1.5),
          )),
      home: Login(),
      routes: {
        "login": (context) => Login(),
        "dashboard": (context) => Dashboard(),
        "edit-profile": (context) => ProfilePage(),
        "mail-config": (context) => MailConfiguration(),
        "shipping-method": (context) => ShippingMethod(),
        ShippingList.routeName: (context) => ShippingList(),
        "payment-method": (context) => PaymentMethod(),
        "faq": (context) => FAQ(),
        "coupon": (context) => Coupon(),
        "customer-list": (context) => CustomerList(),
        "customer-info": (context) => CustomerInfo(),
        "customer-message": (context) => CustomerMessage(),
        "orders": (context) => OrderTable(),
        "orders-details": (context) => OrderDetails(),
        "product-review": (context) => ProductReview(),
        "about-us": (context) => AboutUs(),
        "terms-and-conditions": (context) => TermsAndConditions(),
        "earning-report": (context) => EarningReport(),
        "order-report": (context) => OrderReport(),
        Pending.routeName: (context) => Pending(),
        Processing.routeName: (context) => Processing(),
        OutForDelivery.routeName: (context) => OutForDelivery(),
        Delivered.routeName: (context) => Delivered(),
        Returned.routeName: (context) => Returned(),
        Failed.routeName: (context) => Failed(),
        Cancelled.routeName: (context) => Cancelled(),
        Abandoned.routeName: (context) => Abandoned(),
        Confirmed.routeName: (context) => Confirmed(),
        "adandoned-list": (context) => AbandonedList(),
        "support-ticket": (context) => SupportTicket(),
        "ticket-chat": (context) => TicketChat()
      },
    );
  }
}
