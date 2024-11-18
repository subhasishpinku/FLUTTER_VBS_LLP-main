// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/components/active_subscriptions_chart.dart';
import 'package:admin/components/bar_chart.dart';
import 'package:admin/components/constants.dart';
import 'package:admin/components/footer.dart';
import 'package:admin/components/header.dart';
import 'package:admin/components/side_menu_desktop.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/views/users/user_list.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Footer(),
      drawer: SideMenu(),
      body: Row(
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
                    Header(title: "Users"),
                    SizedBox(height: defaultPadding),
                    //graph x 2
                    if (Responsive.isDesktop(context))
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width / 2,
                              height: 300,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                color: secondaryColor,
                                child: Center(
                                  child: BarChartWidget(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 300,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                color: secondaryColor,
                                child: Center(
                                  child: Chart(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    if (Responsive.isMobile(context))
                      Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              color: secondaryColor,
                              child: Center(
                                child: BarChartWidget(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 300,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              color: secondaryColor,
                              child: Chart(),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 30),
                    //paginated order history by date
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
                        height: 600,
                        child: UserList(),
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
