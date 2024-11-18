// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () {
              Get.toNamed("MAIN_SCREEN");
            },
            child: DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("ORDER_HISTORY");
            },
            child: DrawerListTile(
              title: "Order History",
              svgSrc: "assets/icons/menu_tran.svg",
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("USERS");
            },
            child: DrawerListTile(
              title: "Users",
              svgSrc: "assets/images/user.svg",
            ),
          ),
          InkWell(
            onTap: () {
              // Fluttertoast.showToast(
              //     msg: "NO DATA",
              //     webPosition: "center",
              //     toastLength: Toast.LENGTH_LONG);

              Get.toNamed("SUBSCRIPTIONS");
            },
            child: DrawerListTile(
              title: "Subscriptions",
              svgSrc: "",
              icon: Icons.subscriptions_outlined,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("CONTENT_MANAGEMENT");
            },
            child: DrawerListTile(
              title: "Content Management",
              svgSrc: "assets/icons/menu_doc.svg",
            ),
          ),
          InkWell(
            onTap: () {
              // Fluttertoast.showToast(
              //     msg: "NO DATA",
              //     webPosition: "center",
              //     toastLength: Toast.LENGTH_LONG);
              Get.toNamed("NOTIFICATIONS");
            },
            child: DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("HELP_AND_SUPPORT");
            },
            child: DrawerListTile(
              title: "Help / Support",
              svgSrc: "assets/images/support.svg",
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("COUPONS");
            },
            child: DrawerListTile(
              title: "Coupons",
              svgSrc: "assets/images/coupon.svg",
            ),
          ),
          InkWell(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "NO DATA",
                  webPosition: "center",
                  toastLength: Toast.LENGTH_LONG);
            },
            child: DrawerListTile(
              title: "Reports",
              svgSrc: "assets/images/report.svg",
            ),
          ),
          InkWell(
            onTap: () {
              // Fluttertoast.showToast(
              //     msg: "NO DATA",
              //     webPosition: "center",
              //     toastLength: Toast.LENGTH_LONG);

              Get.toNamed("ENQUIRY");
            },
            child: DrawerListTile(
              title: "Enquiry Box",
              svgSrc: "assets/images/coupon.svg",
            ),
          ),
          InkWell(
            onTap: () {
              // Fluttertoast.showToast(
              //     msg: "NO DATA",
              //     webPosition: "center",
              //     toastLength: Toast.LENGTH_LONG);
              Get.toNamed("ADVERTISEMENTS");
            },
            child: DrawerListTile(
              title: "Advertisements",
              svgSrc: "assets/images/report.svg",
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    this.icon,
  }) : super(key: key);

  final String title, svgSrc;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0.0,
      leading: svgSrc == ""
          ? Icon(icon, color: Colors.white54, size: 16)
          : SvgPicture.asset(
              svgSrc,
              color: Colors.white54,
              height: 16,
            ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
