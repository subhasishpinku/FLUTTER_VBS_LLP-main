import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Coupon extends StatefulWidget {
  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  void initState() {
    super.initState();
    fetchCouponsTable();
  }

  var fetchData;
  Future<void> fetchCouponsTable() async {
    isLoading = true;
    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/coupon/list-coupon');
    var response = await http.get(url);
    setState(() {
      fetchData = jsonDecode(response.body)['couponList'];
    });
    isLoading = false;
  }

  TextEditingController typeControl = TextEditingController();
  TextEditingController titleControl = TextEditingController();
  TextEditingController codeControl = TextEditingController();
  TextEditingController initdateControl = TextEditingController(
      text: DateTime.now().toIso8601String().split('T').first);
  TextEditingController expdateControl = TextEditingController();
  TextEditingController minPurchaseControl = TextEditingController();
  TextEditingController discountControl = TextEditingController();
  TextEditingController disPriceControl = TextEditingController();
  TextEditingController amountControl = TextEditingController();

  String experience = "Type";
  String discountType = "Amount";

  bool isSwitched = false;
  bool isLoading = false;

  Future<void> _initialDatePick() async {
    final initial = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 2),
      lastDate: DateTime(2022, 5),
    );
    setState(() {
      initdateControl.text = initial!.toIso8601String().split('T').first;
    });
  }

  Future<void> _expDatePick() async {
    final initial = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 2),
      lastDate: DateTime(2022, 5),
    );
    setState(() {
      expdateControl.text = initial!.toIso8601String().split('T').first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  backgroundColor: Color(int.parse("0xff397BFA")),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(child: Text("Coupon Form")),
                      Tab(child: Text("Coupons Table"))
                    ],
                  ),
                  title: Text('Coupon'),
                ),
                body: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TabBarView(children: [couponForm(), couponTable()]))));
  }

  couponForm() {
    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(13),
      child: Column(
        children: [
          Text(
            "Coupon Form",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25),
          Container(
              decoration: BoxDecoration(
                  // color: Colors.blue[50],
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(bottom: 25),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: Container(
                height: 30.0,
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration.collapsed(hintText: ''),
                  value: experience,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 10,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {});
                  },
                  items: <String>['Type']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(int.parse("0xff425766")),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                ),
              )),

// ---------------------------------------------

          textFormField(titleControl, "Title"),
          SizedBox(height: 25),
          textFormField(codeControl, "Code"),
          SizedBox(height: 25),
          TextField(
            // enableInteractiveSelection: interect!,
            // controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: _initialDatePick,
                    icon: Icon(Icons.date_range_rounded)),
                labelText: 'Initial Date',
                labelStyle: TextStyle(fontSize: 14.0),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: InputBorder.none),
            style: TextStyle(fontSize: 14.0),

            controller: initdateControl,
          ),
          SizedBox(height: 25),

          TextField(
            // enableInteractiveSelection: interect!,
            // controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: _expDatePick,
                    icon: Icon(Icons.date_range_rounded)),
                labelText: 'Expire Date',
                labelStyle: TextStyle(fontSize: 14.0),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: InputBorder.none),
            style: TextStyle(fontSize: 14.0),

            controller: expdateControl,
          ),

          // textFormField(
          //   initdateControl,
          //   'Initial Date',
          //   // initdateControl != null ? initdateControl.text : 'Initial Date',
          //   // _initialDate.toIso8601String().split('T').first,
          //   // '${_initialDate.day}/${_initialDate.month}/${_initialDate.year.toString().padRight(2, '0')}',
          //   // interect: false,
          //   icon: IconButton(
          //       onPressed: _datePick, icon: Icon(Icons.date_range_rounded)),
          // ),
          // SizedBox(height: 25),
          // textFormField(expdateControl, "Expire Date"),
          SizedBox(height: 25),
          textFormField(minPurchaseControl, "Minimum Purchase"),
          SizedBox(height: 25),
          textFormField(discountControl, "Discount"),
          SizedBox(height: 25),
          textFormField(disPriceControl, "Discount Price"),
          SizedBox(height: 25),
          Container(
              decoration: BoxDecoration(
                  // color: Colors.blue[50],
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(bottom: 25),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: Container(
                height: 30.0,
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration.collapsed(hintText: ''),
                  value: discountType,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 10,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {});
                  },
                  items: <String>['Amount', 'Percentage']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(int.parse("0xff425766")),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                ),
              )),
          submitButton(context, "")
        ],
      ),
    ));
  }

  couponTable() {
    return Container(
        margin: EdgeInsets.all(10),
        height: double.maxFinite,
        child: ListView.builder(
            itemCount: fetchData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.all(10),
                  title: Text(
                    fetchData[index]['type'],
                    style: TextStyle(color: Color(int.parse("0xff758896"))),
                  ),
                  children: [
                    Row(
                      children: [
                        Text(
                          "Title:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['title'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Code:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['code'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Minimum Purchase:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['min_purchase'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Maximum Discount:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(fetchData[index]['max_discount'],
                            style: Theme.of(context).textTheme.bodyText1
                            // style: TextStyle(color: Color(int.parse("0xff7F87A7",)), letterSpacing: 0.5),
                            ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Discount:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['discount'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Discount Type:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['discount_type'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Start Date:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['start_date'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Expire Date:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          fetchData[index]['expire_date'],
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Status:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: fetchData[index]['status'] == 0
                              ? !isSwitched
                              : isSwitched,
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
                        // SizedBox(width: 10),
                        IconButton(onPressed: null, icon: Icon(Icons.update)),
                        IconButton(onPressed: null, icon: Icon(Icons.delete))
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  textFormField(controller, string, {Widget? icon, bool? interect}) {
    return TextField(
      enabled: interect,
      // enableInteractiveSelection: interect!,
      // controller: emailTextEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: icon,
          labelText: string,
          labelStyle: TextStyle(fontSize: 14.0),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          border: InputBorder.none),
      style: TextStyle(fontSize: 14.0),
    );
  }

  Widget submitButton(context, route) {
    return Container(
        // margin: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height / 11,
        width: double.infinity,
        child: ElevatedButton(
            child: Text("Submit", style: TextStyle(fontSize: 15)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(int.parse("0xff397BFA"))),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white38)))),
            onPressed: () async {
              Navigator.pushNamed(context, "dashboard");
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
