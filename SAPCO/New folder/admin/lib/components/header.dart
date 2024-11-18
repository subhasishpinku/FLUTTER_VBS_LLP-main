// ignore_for_file: prefer_const_constructors

import 'package:admin/components/profile_card.dart';
import 'package:admin/components/search_field.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
   Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // drawer(context);
              Scaffold.of(context).openDrawer();
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            title,
            // "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: searchField(context),
        ),
        SizedBox(
          width: 10,
        ),
        profileCard(context),
      ],
    );
  }
}
