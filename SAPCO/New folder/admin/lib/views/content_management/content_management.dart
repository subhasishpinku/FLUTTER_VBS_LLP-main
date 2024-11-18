// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/components/elevated_button.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/content_management_controller.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentManagement extends StatelessWidget {
  ContentManagement({Key? key}) : super(key: key);

  final RxList contentMenu =
      ["About", "Privacy Policy", "How It Works", "Terms & Conditions"].obs;

  final ContentManagementController contentManagementController =
      Get.put(ContentManagementController());

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
                    Header(title: "Content Management"),
                    SizedBox(height: defaultPadding),
                    SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 30),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 125.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              15.0,
                              15.0,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (Responsive.isDesktop(context))
                                Expanded(
                                  child:
                                      // for(var i=0; i<contentMenu.length; i++)
                                      Obx(() {
                                    return ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: contentMenu.length,
                                      itemBuilder: ((context, index) {
                                        return InkWell(
                                          onTap: () {
                                            contentManagementController
                                                .index.value = index;
                                            contentManagementController.index.value ==
                                                    0
                                                ? contentManagementController
                                                        .contentTextController
                                                        .value
                                                        .text =
                                                    contentManagementController
                                                        .aboutText.value
                                                : contentManagementController.index.value ==
                                                        1
                                                    ? contentManagementController
                                                            .contentTextController
                                                            .value
                                                            .text =
                                                        contentManagementController
                                                            .privacyPolicyText
                                                            .value
                                                    : contentManagementController.index.value ==
                                                            2
                                                        ? contentManagementController.contentTextController.value.text =
                                                            contentManagementController.howItWorksText.value
                                                        : contentManagementController.contentTextController.value.text = contentManagementController.termsText.value;
                                          },
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Card(
                                              color: Color(0xFF6861CE),
                                              child: Center(
                                                child: Text(
                                                  contentMenu[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  }),
                                ),
                              SizedBox(
                                width: defaultPadding,
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 600,
                                  // width: 400,
                                  child: Obx(
                                    () => TextField(
                                      controller: contentManagementController
                                          .contentTextController.value,
                                      maxLines: 100,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          elevatedButton(context,
                              label: "SAVE", color: Colors.green),
                        ],
                      ),
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
