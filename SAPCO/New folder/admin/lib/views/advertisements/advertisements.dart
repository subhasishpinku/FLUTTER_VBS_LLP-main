// ignore_for_file: prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:admin/components/elevated_button.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/advertisement_controller.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Advertisement extends StatelessWidget {
  Advertisement({Key? key}) : super(key: key);
  AdvertisementController advertisementController =
      Get.put(AdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: defaultPadding,
                    right: defaultPadding,
                    left: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(title: "Advertisements"),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        advertisementController.pickImage(context);
                      },
                      child: Container(
                        width: 400,
                        height: 400,
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Obx(
                          () => Image.asset(
                            advertisementController.photoUrl.value,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    elevatedButton(
                      context,
                      label: "UPLOAD",
                      color: Colors.green,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
