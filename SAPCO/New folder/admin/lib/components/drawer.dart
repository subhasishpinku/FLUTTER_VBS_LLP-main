import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

@override
Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      controller: ScrollController(),
      children: [
        DrawerHeader(
          child: Image.asset(
            "assets/images/Logo_Car_sewa 1.png",
            height: 5,
          ),
        ),
        drawerListTile(
          context,
          title: "Dashboard",
          svgSrc: "assets/icons/menu_dashbord.svg",
          press: () {
            Get.toNamed("MAIN_SCREEN");
          },
        ),
        drawerListTile(
          context,
          title: "Order History",
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {
            // Fluttertoast.showToast(
            //     msg: "NO DATA",
            //     webPosition: "center",
            //     toastLength: Toast.LENGTH_LONG);
            Get.toNamed("ORDER_HISTORY");
          },
        ),
        drawerListTile(
          context,
          title: "Users",
          svgSrc: "assets/images/user.svg",
          press: () {
            Get.toNamed("USER");
          },
        ),
        drawerListTile(
          context,
          title: "Subscriptions",
          svgSrc: "",
          icon: Icons.subscriptions_outlined,
          press: () {
            // Fluttertoast.showToast(
            //     msg: "NO DATA",
            //     webPosition: "center",
            //     toastLength: Toast.LENGTH_LONG);

            Get.toNamed("SUBSCRIPTIONS");
          },
        ),
        drawerListTile(
          context,
          title: "Content Management",
          svgSrc: "assets/icons/menu_doc.svg",
          press: () {
            // Fluttertoast.showToast(
            //     msg: "NO DATA",
            //     webPosition: "center",
            //     toastLength: Toast.LENGTH_LONG);

            Get.toNamed("CONTENT_MANAGEMENT");
          },
        ),
        drawerListTile(
          context,
          title: "Notification",
          svgSrc: "assets/icons/menu_notification.svg",
          press: () {
            // Fluttertoast.showToast(
            // msg: "NO DATA",
            // webPosition: "center",
            // toastLength: Toast.LENGTH_LONG);
            Get.toNamed("NOTIFICATIONS");
          },
        ),
        drawerListTile(
          context,
          title: "Help / Support",
          svgSrc: "assets/images/support.svg",
          press: () {
            Get.toNamed("HELP_AND_SUPPORT");
          },
        ),
        drawerListTile(
          context,
          title: "Coupons",
          svgSrc: "assets/images/coupon.svg",
          press: () {
            Get.toNamed("COUPONS");
          },
        ),
        drawerListTile(
          context,
          title: "Reports",
          svgSrc: "assets/images/report.svg",
          press: () {
            Fluttertoast.showToast(
                msg: "NO DATA",
                webPosition: "center",
                toastLength: Toast.LENGTH_LONG);
          },
        ),
        drawerListTile(
          context,
          title: "Enquiry Box",
          svgSrc: "assets/images/report.svg",
          press: () {
            // Fluttertoast.showToast(
            //     msg: "NO DATA",
            //     webPosition: "center",
            //     toastLength: Toast.LENGTH_LONG);
            Get.toNamed("ENQUIRY");
          },
        ),
        drawerListTile(
          context,
          title: "Advertisement",
          svgSrc: "assets/images/report.svg",
          press: () {
            // Fluttertoast.showToast(
            //     msg: "NO DATA",
            //     webPosition: "center",
            //     toastLength: Toast.LENGTH_LONG);
            Get.toNamed("ADVERTISEMENTS");
          },
        ),
      ],
    ),
  );
}

@override
Widget drawerListTile(
  BuildContext context, {
  String? title,
  String? svgSrc,
  VoidCallback? press,
  IconData? icon,
}) {
  return ListTile(
    onTap: press,
    horizontalTitleGap: 0.0,
    leading: svgSrc == ""
        ? Icon(icon, color: Colors.white54, size: 16)
        : SvgPicture.asset(
            svgSrc!,
            color: Colors.white54,
            height: 16,
          ),
    title: Text(
      title!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.white54),
    ),
  );
}
