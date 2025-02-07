import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_ios/models/user_model.dart';
import 'package:global_ios/screens/home.dart';
import 'package:global_ios/screens/login.dart';
import 'package:global_ios/utilities/appbar.dart';

class CreateAccount extends StatefulWidget {
  User userData;
  CreateAccount(this.userData);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String? username;
  final usersRef = FirebaseFirestore.instance.collection('users');

  submit() async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();

      List<DocumentSnapshot> verifyUSerName =
          (await usersRef.where("username", isEqualTo: this.username).get())
              .docs;
      if (verifyUSerName.length > 0) {
        SnackBar snackBar = SnackBar(
            content: Text(
                'Username is allready ocupied please choose another one.'));
        _scaffoldKey.currentState!.showSnackBar(snackBar);
        return;
      }
      print(widget.userData);
//      return;
      await usersRef
          .doc(widget.userData.userId)
          .update({"username": username, "displayName": username});
      DocumentSnapshot doc = await usersRef.doc(widget.userData.userId).get();
      SnackBar snackBar = SnackBar(content: Text('Welcome $username!'));
      _scaffoldKey.currentState!.showSnackBar(snackBar);
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => Home(widget.userData)), (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: header(context, false, 'Set up your profile', true),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Text(
                      'Create a username',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.trim().length < 3 || val.isEmpty) {
                            return 'Username too short';
                          } else if (val.trim().length > 12) {
                            return 'Username too long';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) => username = val,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          labelStyle: TextStyle(fontSize: 15.0),
                          hintText: 'Must be atleast 3 characters',
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: submit,
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
