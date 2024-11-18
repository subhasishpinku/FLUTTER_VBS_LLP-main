import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:http/http.dart' as http;

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  bool _isLoading = false;
  bool _isLoading2 = false;
  String searchValue = 'rahul';

  void initState() {
    super.initState();
    fetchCustomerList();
  }

  List mainFetchData = [];
  List fetchData = [];

  Future<void> fetchCustomerList() async {
    _isLoading = true;
    try {
      final url = Uri.parse(
          'https://development.lifeproductions.in/sreelathers/api/admin/customer/customer-list');
      var response = await http.get(
        url,
      );
      setState(() {
        mainFetchData = jsonDecode(response.body)['customerList'];
        fetchData = mainFetchData;
      });

      print(fetchData);
    } catch (err) {
      print(err);
    }
    _isLoading = false;
  }

  storedSearching(String search) {
    print('-------storedData--------');
    final da = mainFetchData.where((element) =>
        element['name'].toLowerCase().contains(search.toLowerCase()));
    print(da);
    setState(() {
      fetchData = da.toList();
    });
  }

// --------------------searching with post method------------------------------------------
  // searching(searchValue) async {
  //   _isLoading2 = true;
  //   final url = Uri.parse(
  //       'https://development.lifeproductions.in/sreelathers/api/admin/customer/customer-search');

  //   var response = await http.post(url, body: {"search": searchValue});

  //   // final data = jsonDecode(response.body);
  //   print('-----------------------------------------');
  //   // print(
  //   final data = json.decode(response.body);

  //   setState(() {
  //     fetchData = data['customerList'];
  //   });
  //   _isLoading2 = false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text("Customer"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(padding: EdgeInsets.all(15), children: [
              // ----------------------------------------
              Text(
                "Customer List",
                style: TextStyle(
                  color: AppColors.title,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize(context, 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              TextField(
                onChanged: (value) {
                  setState(() {
                    storedSearching(value);
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search customer',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {});
                      },
                    )),
              ),
              // ),
              SizedBox(height: 20),
              _isLoading2
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(children: this.table())
            ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appBarColor,
        child: Icon(Icons.add),
        onPressed: null,
        focusColor: Color(int.parse("0xff397BFA")),
      ),
    );
  }

  List<Column> table() {
    List<Column> data = [];

    for (int index = 0; index < fetchData.length; index++) {
      data.add(
        Column(
          children: [
            Card(
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 10),
                title: Text(
                  fetchData[index]['name'],
                  style: TextStyle(
                      color: AppColors.title, fontSize: fontSize(context, 25)),
                ),
                tilePadding: EdgeInsets.all(5),
                // trailing: Icon(Icons.add),
                children: [
                  Row(
                    children: [
                      // Text("Email: ", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
                      Icon(Icons.email, color: AppColors.title),
                      SizedBox(width: 5),
                      Text(
                        fetchData[index]['email'],
                        style: TextStyle(
                            color: AppColors.title,
                            fontSize: fontSize(context, 25),
                            letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.phone, color: AppColors.title),
                      SizedBox(width: 5),
                      Text(
                        fetchData[index]['phone'],
                        style: TextStyle(
                            color: AppColors.title,
                            fontSize: fontSize(context, 25),
                            letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.shopping_cart, color: AppColors.title),
                      SizedBox(width: 5),
                      Text(
                        fetchData[index]['totalOrder'].toString(),
                        style: TextStyle(
                            color: AppColors.title,
                            fontSize: fontSize(context, 25),
                            letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
                      // SizedBox(width: 10),
                      IconButton(
                        onPressed: () => Navigator.pushNamed(
                            context, "customer-info", arguments: {
                          'name': fetchData[index]['name'],
                          'orderList': fetchData[index]['orderList']
                        }),
                        icon: Icon(Icons.remove_red_eye),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return data;
  }

  Widget content(icon, text) {
    return Row(
      children: [
        Icon(Icons.shopping_cart, color: AppColors.title),
        SizedBox(width: 5),
        Text(
          "12 orders",
          style: TextStyle(
              color: AppColors.title,
              fontSize: fontSize(context, 25),
              letterSpacing: 0.5),
        ),
      ],
    );
  }
}
