import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/textForm.dart';

enum SingingCharacter { active, inactive }

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  SingingCharacter? _character = SingingCharacter.active;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(int.parse("0xff397BFA")),
          title: Text("Payment Method"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [codWidget(), SizedBox(height: 20), razorPayWidget()],
          ),
        ));
  }

  codWidget() {
    return Card(
      child: ExpansionTile(
        title: Text(
          "System Default Payment Method",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Cash on Delivery"),
        children: [
          ListTile(
            title: const Text('Active'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.active,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Inactive'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.inactive,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          saveButton()
        ],
      ),
    );
  }

  razorPayWidget() {
    return Card(
      child: ExpansionTile(
        title: Text(
          "Razor Pay",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.only(left: 15, right: 15),
        children: [
          Text("Razor Pay",
              style: TextStyle(color: Color(int.parse("0xff758396")))),
          ListTile(
            title: const Text('Active'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.active,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Inactive'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.inactive,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Text("Key"),
          SizedBox(height: 10),
          TextField(
            // controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                // labelText: string,
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
                    borderRadius: BorderRadius.circular(10)),
                border: InputBorder.none),
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 20),
          Text("Secret"),
          SizedBox(height: 10),
          TextField(
            // controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                // labelText: string,
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
                    borderRadius: BorderRadius.circular(10)),
                border: InputBorder.none),
            style: TextStyle(fontSize: 14.0),
          ),
          Center(child: saveButton())
        ],
      ),
    );
  }

  Widget saveButton() {
    return Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 15,
        width: 100,
        child: ElevatedButton(
            child: Text("Save", style: TextStyle(fontSize: 20)),
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
}
