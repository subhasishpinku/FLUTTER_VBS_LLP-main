import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShippingList extends StatefulWidget {
  static const routeName = 'shippingList';
  const ShippingList({Key? key}) : super(key: key);

  @override
  _ShippingListState createState() => _ShippingListState();
}

class _ShippingListState extends State<ShippingList> {
  dynamic shipList;
  bool isLoading = false;

  Future<void> getShippingList() async {
    try {
      isLoading = true;
      final url = Uri.parse(
          "https://development.lifeproductions.in/sreelathers/api/admin/Shipping/list-shipping_method");

      final response = await http.get(url);
      final data = json.decode(response.body);
      setState(() {
        shipList = data['shipping_list'];
      });
      isLoading = false;
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    getShippingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shipping List')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: shipList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ('${index + 1}.').toString(),
                            ),
                            Text('duration: ${shipList[index]['duration']}')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(shipList[index]['title']),
                            Text('₹ : ${shipList[index]['cost']}')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
