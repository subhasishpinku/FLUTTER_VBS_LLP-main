// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/constants.dart';
import 'package:admin/components/elevated_button.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/individual_user_component.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/controllers/subscription_controller.dart';
import 'package:admin/models/subscription_model.dart';
import 'package:admin/views/subscriptions/subscription_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class Subscriptions extends StatelessWidget {
  Subscriptions({Key? key}) : super(key: key);

  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());

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
                    Header(title: "Subscriptions"),
                    SizedBox(height: defaultPadding),
                    SizedBox(height: defaultPadding),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: subscriptionModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 650 ? 2 : 4,
                        crossAxisSpacing: defaultPadding,
                        mainAxisSpacing: defaultPadding,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 650 &&
                                    MediaQuery.of(context).size.width > 350
                                ? 1.3
                                : 1,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            subscriptionController.index.value = index;

                            subscriptionController.photo.value =
                                subscriptionModel[index]['img'];
                            subscriptionController.name.value.text =
                                subscriptionModel[index]['name'];
                            subscriptionController.purchasedCount.value.text =
                                subscriptionModel[index]['purchasedCount'];
                            subscriptionController.description.value.text =
                                subscriptionModel[index]['desc'];

                            print(subscriptionController.photo.value);
                          },
                          child: subscriptionGridCard(
                            context,
                            title: subscriptionModel[index]['name'],
                            count: subscriptionModel[index]['purchasedCount'],
                            svgSrc: subscriptionModel[index]['img'],
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Subscription Description
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
                          // Image
                          Container(
                            height: 120.0,
                            width: 120.0,
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
                            child: Obx(
                              () => InkWell(
                                onTap: () async {
                                  await subscriptionController
                                      .pickImage(context);
                                },
                                child: SvgPicture.asset(
                                  subscriptionController.photo.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: Responsive.isDesktop(context)
                                ? (1 / .36)
                                : Responsive.isTablet(context)
                                    ? (1 / .1)
                                    : (1 / .36),
                            crossAxisCount:
                                Responsive.isDesktop(context) ? 2 : 1,
                            crossAxisSpacing: 50,
                            mainAxisSpacing: Responsive.isDesktop(context)
                                ? 0
                                : Responsive.isTablet(context)
                                    ? 5
                                    : 10,
                            children: [
                              Obx(
                                () => individualUserComponent(
                                  context,
                                  name: "Name",
                                  label: "Name",
                                  textInputType: TextInputType.name,
                                  controller: subscriptionController.name.value,
                                ),
                              ),
                              Obx(
                                () => individualUserComponent(
                                  context,
                                  name: "Purchased Count",
                                  label: "Purchased Count",
                                  textInputType: TextInputType.name,
                                  controller: subscriptionController
                                      .purchasedCount.value,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: subscriptionController
                                          .description.value,
                                      maxLines: null,
                                      expands: true,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        labelText: "Description",
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          elevatedButton(context,
                              label: "SAVE", color: Colors.green),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
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


// if (Responsive.isDesktop(context))
                    //   Row(
                    //     children: [
                    //       Expanded(
                    //         child: SizedBox(
                    //           // width: MediaQuery.of(context).size.width / 2,
                    //           height: 300,
                    //           child: Card(
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: const BorderRadius.all(
                    //                 Radius.circular(10.0),
                    //               ),
                    //             ),
                    //             color: secondaryColor,
                    //             child: Center(
                    //               child: BarChartWidget(),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Expanded(
                    //         child: SizedBox(
                    //           height: 300,
                    //           child: Card(
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: const BorderRadius.all(
                    //                 Radius.circular(10.0),
                    //               ),
                    //             ),
                    //             color: secondaryColor,
                    //             child: Center(
                    //               child: Chart(),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),

                    // if (Responsive.isMobile(context))
                    //   Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 300,
                    //         child: Card(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: const BorderRadius.all(
                    //               Radius.circular(10.0),
                    //             ),
                    //           ),
                    //           color: secondaryColor,
                    //           child: Center(
                    //             child: BarChartWidget(),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       SizedBox(
                    //         height: 300,
                    //         child: Card(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: const BorderRadius.all(
                    //               Radius.circular(10.0),
                    //             ),
                    //           ),
                    //           color: secondaryColor,
                    //           child: Chart(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // SizedBox(height: 30),
                    // //paginated order history by date
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.all(defaultPadding),
                    //   decoration: BoxDecoration(
                    //     color: secondaryColor,
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(10),
                    //     ),
                    //   ),
                    //   child: SizedBox(
                    //     height: 600,
                    //     child: SubscriptionList(),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),