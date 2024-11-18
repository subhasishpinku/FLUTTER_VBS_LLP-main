import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/API/server.dart';
import 'package:sreelethers_admin/Widgets/Utilities/textForm.dart';
import 'package:http/http.dart' as http;

class ShippingMethod extends StatefulWidget {
  @override
  _ShippingMethodState createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController durationController = new TextEditingController();
  TextEditingController costController = new TextEditingController();

  bool _isLoading = false;

  Future<void> save() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse(
          'https://development.lifeproductions.in/sreelathers/api/admin/Shipping/add-shipping_method');

      await http.post(url, body: {
        "creator_id": Server.creatorId.toString(),
        "title": titleController.text.toString(),
        "cost": costController.text.toString(),
        "duration": durationController.text.toString()
      }).then((respons) {
        print(respons.statusCode);
        setState(() {
          _isLoading = false;
        });
      });

      // http.post(
      //   url,
      //   body: {
      // "creator_id": Server.creatorId.toString(),
      // "title": titleController.text.toString(),
      // "cost": costController.text.toString(),
      // "duration": durationController.text.toString()
      //   },
      // ).then((respons) {
      //   print(respons.statusCode);
      //   setState(() {
      //     _isLoading = false;
      //   });
      // });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateShippingMethod(
      id, creator_id, title, cost, duration) async {
    try {
      final url = Uri.parse(
          "https://development.lifeproductions.in/sreelathers/api/admin/Shipping/update-shipping_method/$id");

      await http.post(url, body: {
        "creator_id": creator_id,
        "title": title,
        "cost": cost,
        "duration": duration
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse("0xff397BFA")),
        title: Text("Shipping Method"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(25),
          child: Form(
            child: Column(
              children: [
                Text("Shipping Method Form",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse("0xff877F87")))),
                SizedBox(height: 20),
                textFormField(titleController, "Title"),
                SizedBox(height: 20),
                textFormField(durationController, "Duration"),
                SizedBox(height: 20),
                textFormField(costController, "Cost"),
                // SizedBox(height: 20),
                // saveButton(context, "route"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: save,
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
