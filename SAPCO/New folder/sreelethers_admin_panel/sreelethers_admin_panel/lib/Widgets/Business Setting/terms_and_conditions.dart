import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool _isLoading = false;
  var fetchData;

  Future<void> fetchTermsAndConditions(termsvalue) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/terms/terms-condition');
    var response = await http.post(url, body: ({'value': termsvalue}));
    setState(() {
      fetchData = jsonDecode(response.body);
    });
    _isLoading = false;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(fetchData['msg'])));
    print(fetchData);
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(
          int.parse("0xff397BFA"),
        ),
        title: Text("General Business Settings"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms and Conditions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 8,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  hintText: "Enter text",
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  errorStyle: TextStyle(
                    color: Color(
                      int.parse("0xff073384"),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.black38),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  )),
            ),
            SizedBox(height: 20),
            signInButton(context)
          ],
        ),
      ),
    );
  }

  Widget signInButton(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height / 15,
      width: double.infinity,
      child: ElevatedButton(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 7,
                ),
              )
            : Text("Submit", style: TextStyle(fontSize: 15)),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(int.parse("0xff397BFA"))),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white38)))),
        onPressed: () {
          // Navigator.pushNamed(context, "dashboard");
          fetchTermsAndConditions(_controller.text);
        },
      ),
    );
  }
}
