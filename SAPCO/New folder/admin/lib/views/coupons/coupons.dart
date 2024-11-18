// ignore_for_file: prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:admin/components/elevated_button.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/individual_user_component.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/coupon_controller.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/models/coupons_model.dart';
import 'package:admin/models/subscription_model.dart';
import 'package:admin/views/coupons/coupons_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Coupons extends StatelessWidget {
  Coupons({Key? key}) : super(key: key);

  final CouponController couponController = Get.put(CouponController());

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
                    Header(title: "Coupons"),
                    SizedBox(height: defaultPadding),
                    SizedBox(height: defaultPadding),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: couponsModel.length,
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
                            couponController.index.value = index;

                            couponController.photo.value =
                                subscriptionModel[index]['img'];
                            couponController.name.value.text =
                                subscriptionModel[index]['name'];
                            couponController.description.value.text =
                                subscriptionModel[index]['desc'];
                            couponController.date.value.text =
                                subscriptionModel[index]['date'];

                            // print(subscriptionController.photo.value);
                          },
                          child: coupondGridCard(
                            context,
                            name: couponsModel[index]['name'],
                            svgSrc: couponsModel[index]['img'],
                            desc: couponsModel[index]['desc'],
                            date: couponsModel[index]['date'],
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
                                  await couponController.pickImage(context);
                                },
                                child: SvgPicture.asset(
                                  couponController.photo.value,
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
                                  controller: couponController.name.value,
                                ),
                              ),
                              Obx(
                                () => individualUserComponent(
                                  context,
                                  name: "Date",
                                  label: "Date",
                                  textInputType: TextInputType.name,
                                  controller: couponController.date.value,
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
                                      controller:
                                          couponController.description.value,
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
