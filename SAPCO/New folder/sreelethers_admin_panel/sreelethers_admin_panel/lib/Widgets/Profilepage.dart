import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget
{
	@override
	_ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  with SingleTickerProviderStateMixin
{
	TextEditingController emailController = new TextEditingController();
	TextEditingController passwordController = new TextEditingController();

	@override
	void initState()
	{
		super.initState();
	}

	@override
	Widget build(BuildContext context)
	{
		return  DefaultTabController
		(
        	length: 2,
        	child: Scaffold
			(
				resizeToAvoidBottomInset: false,
          		appBar: AppBar
				(
					backgroundColor: Color(int.parse("0xff397BFA")),
            		bottom: TabBar
					(
						tabs:
						[
							Tab(child: Text("Basic Information")),
							Tab(child: Text("Password"))
						],
            		),
            		title: Text('Settings'),
          		),
          		body: TabBarView
				(
					children:
					[
						editProfile(),
						changePassword()
					]
          		)
			)
    	);
	}

	editProfile()
	{
		return SingleChildScrollView
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
				child: Column
				(
					children:
					[
						Container
						(
							padding: EdgeInsets.only(bottom: 20),
							child: Stack
							(
								children: 
								[
									CircleAvatar
									(
										radius: 50,
										backgroundImage: NetworkImage("https://images.pexels.com/photos/6311079/pexels-photo-6311079.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
									),
									Positioned
									(
										right: -2,
										bottom: -15,
										child: IconButton
										(
											onPressed: null, 
											icon: Icon(Icons.camera_alt_rounded, size: 25)
										)
									)
								],
							)
						),
						textFormField(emailController, "Full Name"),
						SizedBox(height: 25),
						textFormField(passwordController, "Phone"),
						SizedBox(height: 25),
						textFormField(passwordController, "Email"),
						SizedBox(height: 25),
						saveButton(context, "")
					],
				),
			)
		);
	}

	changePassword()
	{
		return Container
		(
			decoration: BoxDecoration
			(
				border: Border.all(color: Colors.black12),
				borderRadius: BorderRadius.circular(10),
			),
			padding: EdgeInsets.all(25),
			margin: EdgeInsets.all(25),
			child: Column
			(
				children:
				[
					textFormField(emailController, "New Password"),
					SizedBox(height: 25),
					textFormField(passwordController, "Confirm Password"),
					SizedBox(height: 25),
					saveButton(context, "")
				],
			),
		);
	}

	textFormField(controller, string)
	{
		return TextField
		(
			// controller: emailTextEditingController,
			keyboardType: TextInputType.emailAddress,
			decoration: InputDecoration
			(
				labelText: string,
				labelStyle: TextStyle(fontSize: 14.0),
				hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
				enabledBorder: OutlineInputBorder
				(
                	borderRadius: BorderRadius.circular(5.0),
                  	borderSide: BorderSide
					(
                    	color: Colors.black12,
                    	width: 0.5,
                  	),
                ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(10)),
            border: InputBorder.none),
			style: TextStyle(fontSize: 14.0),
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