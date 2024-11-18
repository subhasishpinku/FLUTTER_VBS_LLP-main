import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/textForm.dart';

class MailConfiguration extends StatefulWidget 
{
	@override
	_MailConfigurationState createState() => _MailConfigurationState();
}

class _MailConfigurationState extends State<MailConfiguration> 
{
	TextEditingController nameController = new TextEditingController();

	@override
  	Widget build(BuildContext context) 
	{
		return Scaffold
		(
			appBar: AppBar
			(
				backgroundColor: Color(int.parse("0xff397BFA")),
				title: Text("Mail Configuration"),
			),
			body: SingleChildScrollView
			(
				child: Container
				(
					decoration: BoxDecoration
					(
						border: Border.all(color: Colors.black12),
						borderRadius: BorderRadius.circular(10),
					),
					padding: EdgeInsets.all(25),
					margin: EdgeInsets.all(25),
					child: Form
					(
						child: Column
						(
							children: 
							[
								Text("SMTP Mail Setup", style: TextStyle(fontWeight: FontWeight.bold, color: Color(int.parse("0xff877F87")))),
								SizedBox(height: 20),
								textFormField(nameController, "Mailer Name"),
								SizedBox(height: 20),
								textFormField(nameController, "Host"),
								SizedBox(height: 20),
								textFormField(nameController, "Driver"),
								SizedBox(height: 20),
								textFormField(nameController, "Port"),
								SizedBox(height: 20),
								textFormField(nameController, "Username"),
								SizedBox(height: 20),
								textFormField(nameController, "Email ID"),
								SizedBox(height: 20),
								textFormField(nameController, "Encryption"),
								SizedBox(height: 20),
								textFormField(nameController, "Password"),
								SizedBox(height: 20),
								saveButton(context, "route"),
								SizedBox(height: 20),
							],
						),
					)
				)
			)
		);
  	}

	Widget saveButton(context, route)
	{
		return Container
		(
			// margin: EdgeInsets.only(bottom: 10),
			height: MediaQuery.of(context).size.height / 11,
			width: double.infinity,
			child: ElevatedButton
			(
				child: Text
				(
					"Save Changes",
					style: TextStyle(fontSize: 15)
				),
				style: ButtonStyle
				(
					foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
					backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse("0xff397BFA"))),
					shape: MaterialStateProperty.all<RoundedRectangleBorder>
					(
						RoundedRectangleBorder
						(
							borderRadius: BorderRadius.circular(10),
							side: BorderSide(color: Colors.white38)
						)
					)
				),
				onPressed: () async
				{
					Navigator.pushNamed(context, "dashboard");
				}
			)
		);
	}
}