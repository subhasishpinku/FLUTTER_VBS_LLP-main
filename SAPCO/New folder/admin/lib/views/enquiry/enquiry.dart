// ignore_for_file: prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:admin/components/elevated_button.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/enquiry_controller.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/views/enquiry/enquiry_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Enquiry extends StatelessWidget {
  Enquiry({Key? key}) : super(key: key);

  final EnquiryController enquiryController = Get.put(EnquiryController());

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
                    Header(title: "Enquiry"),
                    SizedBox(height: defaultPadding),
                    SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                        height: 400,
                        child: EnquiryList(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => SvgPicture.asset(
                        enquiryController.photoUrl.value,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Query"),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 2
                          : 400,
                      child: Obx(
                        () => TextField(
                          controller: enquiryController.query.value,
                          maxLines: 100,
                          // style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Reply"),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 2
                          : 400,
                      child: TextField(
                        maxLines: 100,
                        // style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    elevatedButton(
                      context,
                      label: "REPLY",
                      color: Colors.green,
                    ),
                    SizedBox(height: 30),
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
