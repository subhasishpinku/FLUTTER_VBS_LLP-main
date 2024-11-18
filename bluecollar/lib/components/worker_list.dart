// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget workerListCard() {
  return Builder(builder: (context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              Container(
                width: Get.width - 60,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Color(0xffFC4A1A),
                ),
              ),
              Positioned(
                left: 4,
                // top: 1,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  width: Get.width - 64,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Color.fromRGBO(242, 241, 248, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/maskk.png',
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Jane Doe"),
                                  Text(
                                    "Maid",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xffFC4A1A),
                                          Color(0xffF7B733)
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    child: InkWell(
                                      child: Text(
                                        "Pay Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ),
                                      onTap: () {
                                        // Get.toNamed("WORKERSDETALIS");
                                        // DialogExample();
                                        showAlertDialog(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'images/arrow.svg',
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  });
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget paybutton = Container(
    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
    decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC4A1A), Color(0xffF7B733)]),
        borderRadius: BorderRadius.circular(25.0)),
    child: InkWell(
      child: Text(
        "Pay",
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
      onTap: () {
        Get.toNamed("WORKERSDETALIS");
      },
    ),
  );
  Widget cancelButton = Container(
    width: 92,
    height: 36,
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(0XFFFC4A1A),
        ),
        borderRadius: BorderRadius.circular(18)),
    child: InkWell(
      child: Center(
        child: Text(
          "Paid",
          style: TextStyle(color: Color(0XFFFC4A1A), fontSize: 12.0),
        ),
      ),
      onTap: () {
        // Get.toNamed('PRIVACY_POLICY');
      },
    ),
  );

  Widget continueButton = Container(
    width: 92,
    height: 36,
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(0XFFFC4A1A),
        ),
        borderRadius: BorderRadius.circular(18)),
    child: InkWell(
      child: Center(
        child: Text(
          "Remind Later",
          style: TextStyle(color: Color(0XFFFC4A1A), fontSize: 12.0),
        ),
      ),
      onTap: () {
        // Get.toNamed('PRIVACY_POLICY');
      },
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Container(
        child: Row(
      children: [
        Image.asset('images/diolog_mask.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "Jane doe",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          "Maid",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ],
    )),
    actions: [
      paybutton,
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
