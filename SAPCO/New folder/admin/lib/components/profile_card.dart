import 'package:flutter/material.dart';

import 'constants.dart';

enum Menu { Logout }

Widget profileCard(BuildContext context) {
  String selectedMenu = '';
  return InkWell(
    onTap: () {},
    child: Container(
      // margin: const EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          // if (!Responsive.isMobile(context))
          const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Admin"),
          ),
          // Icon(Icons.keyboard_arrow_down),
          PopupMenuButton<Menu>(
            icon: const Icon(Icons.keyboard_arrow_down),
            onSelected: (Menu item) {
              selectedMenu = item.name;
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.Logout,
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}