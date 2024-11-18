// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    // required this.title,
  }) : super(key: key);

  // String title = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: secondaryColor,
      child: Center(
        child: Text("Build by Sapco"),
      ),
    );

    // Row(
    //   children: [
    //     if (!Responsive.isDesktop(context))
    //       IconButton(
    //         icon: const Icon(Icons.menu),
    //         onPressed: () {
    //           // drawer(context);
    //           Scaffold.of(context).openDrawer();
    //         },
    //       ),
    //     if (!Responsive.isMobile(context))
    //       Text(
    //         title,
    //         // "Dashboard",
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //     if (!Responsive.isMobile(context))
    //       Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
    //     Expanded(
    //       child: searchField(context),
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     profileCard(context),
    //   ],
    // );
  }
}
