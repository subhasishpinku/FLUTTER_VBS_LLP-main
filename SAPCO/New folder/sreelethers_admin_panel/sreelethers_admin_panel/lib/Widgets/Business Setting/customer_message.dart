import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:http/http.dart' as http;

class CustomerMessage extends StatefulWidget {
  @override
  _CustomerMessageState createState() => _CustomerMessageState();
}

class _CustomerMessageState extends State<CustomerMessage> {
  bool isSwitched = false;
  String _chosenValue = "";
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCustomerMessage();
  }

  var fetchData;
  Future<void> fetchCustomerMessage() async {
    _isLoading = true;
    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/customer/customer-message-list');

    var response = await http.get(url);
    setState(() {
      fetchData = jsonDecode(response.body)['custMessageList'];
    });
    print(fetchData);
    print(fetchData);
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse("0xff397BFA")),
        title: Text("Customer Message List"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Customer Message Table",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  tableWidget()
                ],
              ),
            ),
    );
  }

  Widget tableWidget() {
    return Container(
        height: double.maxFinite,
        child: ListView.builder(
            itemCount: fetchData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.all(10),
                  title: Text(
                    fetchData[index]['name'],
                    style: TextStyle(color: Color(int.parse("0xff758896"))),
                  ),
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone, color: AppColors.iconColor),
                        SizedBox(width: 10),
                        Text(
                          fetchData[index]['mobile_number'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Row(
                      children: [
                        Icon(Icons.email, color: AppColors.iconColor),
                        SizedBox(width: 10),
                        Text(
                          fetchData[index]['email'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Subject :",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[500]),
                    ),
                    SizedBox(height: 5),
                    Text(
                      fetchData[index]['subject'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[500]),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
                        // SizedBox(width: 10),
                        IconButton(onPressed: null, icon: Icon(Icons.edit)),
                        IconButton(onPressed: null, icon: Icon(Icons.delete))
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
