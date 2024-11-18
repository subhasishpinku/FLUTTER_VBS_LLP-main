import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:http/http.dart' as http;

class ProductReview extends StatefulWidget {
  @override
  _ProductReviewState createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  bool isLoading = false;
  var fetchData;
  Future<void> fetchProductReview() async {
    isLoading = true;
    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/review/review-list');
    final respose = await http.get(url);
    final data = jsonDecode(respose.body);
    setState(() {
      fetchData = data['reviewList'];
      print(fetchData);
    });
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchProductReview();
  }

  bool isSwitched = false;
  String _chosenValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse("0xff397BFA")),
        title: Text("Product Review"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.all(15),
              children: [
                Row(
                  children: [
                    Text(
                      "Review List",
                      style: TextStyle(
                          color: AppColors.title,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(context, 20)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(children: table())
              ],
            ),
    );
  }

  List<Column> table() {
    List<Column> data = [];

    for (int index = 0; index < fetchData.length; index++) {
      data.add(Column(children: [
        Card(
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            childrenPadding: EdgeInsets.all(10),
            title: Text(
              (index + 1).toString() +
                  "." +
                  ' Product: ${fetchData[index]['product']}',
              style: TextStyle(
                  color: AppColors.title, fontSize: fontSize(context, 23)),
            ),
            children: [
              Text(
                "Customer: ${fetchData[index]['customer']}",
                style: TextStyle(color: AppColors.title, letterSpacing: 0.5),
              ),
              SizedBox(height: 15),
              Text("Review: ${fetchData[index]['review']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: AppColors.title)),
              SizedBox(height: 15),
              Text("Rating: ${fetchData[index]['rating']} ⭐",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: AppColors.title)),
            ],
          ),
        )
      ]));
    }
    return data;
  }

  // void toggleSwitch(bool value)
  // {
  //   	if(isSwitched == false)
  //   	{
  //     		setState(()
  // 		{
  //       		isSwitched = true;
  //     		});
  //     		print('Switch Button is ON');
  //  	 	}
  //   	else
  //   	{
  //     		setState(()
  // 		{
  //       		isSwitched = false;
  //     		});
  //     		print('Switch Button is OFF');
  //   	}
  // 	}
}
