// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluecollar/components/primary_button.dart';
import 'package:bluecollar/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F9),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(2, 4),
                            blurRadius: 12),
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'images/arrow_back.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Text(
                  'My profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                onTap: () {
                  // Get.toNamed("WAGE_DETAILS");
                },
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Stack(children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Color(0xffffffff),
                    child: CircleAvatar(
                      foregroundImage: AssetImage('images/Ellipse17.png'),
                      // NetworkImage(
                      //     'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 19,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xFF020D4D),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/user_name.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'First Name',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter First Name", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/user_name.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Last Name',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Last Name", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/dob.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'First DOB',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Date of Birth", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/gender.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Gender',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Gender", suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/mobile.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mobile Number',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Mobile Number", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/emails.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Email Id',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Email Id", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/id_proof.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Id Proof ',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Id Proof", suffixicon: Icons.expand_more),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/pin_code.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Pin Code',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Pin Code", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/state.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'State',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter State", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/city.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'City',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter City", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/locations.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Location',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Location", suffixicon: Icons.edit),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('images/address1.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Address',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textfield("Enter Address", suffixicon: Icons.edit),
              SizedBox(
                height: 30,
              ),
              Center(
                child: primaryButton(
                  context,
                  label: "Update",
                  toName: "CUSTOMER_REVIEWS",
                  onPressed: () async {
                    // await saveLogin();
                    // await saveRegistration(context);
                    // Get.toNamed("CUSTOMERREVIEWS");
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
