import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isLoading = false;
  var fetchData;
  Future<void> fetchFaq() async {
    isLoading = true;
    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/faq/list-faq');

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      fetchData = data['faq_list'];
      print(fetchData);
    });
    isLoading = false;
  }

  void initState() {
    super.initState();
    fetchFaq();
  }

  bool isSwitched = false;
  String _chosenValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse("0xff397BFA")),
        title: Text("Dashboard Help Topic"),
      ),
      body: isLoading
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
                        "Help Topic Table",
                        style: TextStyle(
                            color: Color(int.parse("0xff7F87A7")),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  tableWidget()
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(int.parse("0xff397BFA")),
        child: Icon(Icons.add),
        onPressed: null,
        focusColor: Color(int.parse("0xff397BFA")),
      ),
    );
  }

  Widget tableWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: fetchData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: EdgeInsets.all(10),
              title: Text(
                fetchData[index]['question'],
                style: TextStyle(color: Color(int.parse("0xff758896"))),
              ),
              children: [
                Text(
                  "ANSWER:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey[500]),
                ),
                SizedBox(height: 5),
                Text(
                  fetchData[index]['answer'],
                  style: TextStyle(
                      color: Color(int.parse(
                        "0xff7F87A7",
                      )),
                      letterSpacing: 0.5),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "RANKING:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[500]),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${fetchData[index]['ranking']}',
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
                      "STATUS:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[500]),
                    ),
                    Switch(
                      onChanged: toggleSwitch,
                      value: fetchData[index]['status'] == 0
                          ? isSwitched
                          : !isSwitched,
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
                    IconButton(onPressed: null, icon: Icon(Icons.edit)),
                    IconButton(onPressed: null, icon: Icon(Icons.delete))
                  ],
                )
              ],
            ),
          );
        });
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
