import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  @override
  _CustomerInfoState createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  String name = '';
  List orderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      var id = ModalRoute.of(context)!.settings.arguments as Map;

      setState(() {
        name = id['name'];
        orderList = id['orderList'];
      });
      print(name);
      print(orderList);
    });
  }

  Future<void> fetchCustomerItem() async {}
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: orderList.isEmpty
          ? Center(
              child: Text('No Order Items'),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [orderTable()],
              ),
            ),
    );
  }

  Widget orderTable() {
    return Container(
        height: double.maxFinite,
        child: ListView.builder(
            itemCount: orderList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.only(left: 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Order Id: ${orderList[index]['orderId']}",
                        style: TextStyle(color: Color(int.parse("0xff758896"))),
                      ),
                    ],
                  ),
                  // Text
                  // (
                  // 	"Order Id: 10001",
                  // 	style: TextStyle(color: Color(int.parse("0xff758896"))),
                  // ),
                  tilePadding: EdgeInsets.all(5),
                  // trailing: Icon(Icons.add),
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total: ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "₹ ${orderList[index]['order_amount']}",
                          style: TextStyle(
                              color: Color(int.parse(
                                "0xff7F87A7",
                              )),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    // Row
                    // (
                    // 	mainAxisAlignment: MainAxisAlignment.end,
                    // 	children:
                    // 	[
                    // 		// Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
                    // 		// SizedBox(width: 10),
                    // 		IconButton(onPressed: null, icon: Icon(Icons.receipt)),
                    // 		IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye)),
                    // 	],
                    // ),
                  ],
                ),
              );
            }));
  }
}
