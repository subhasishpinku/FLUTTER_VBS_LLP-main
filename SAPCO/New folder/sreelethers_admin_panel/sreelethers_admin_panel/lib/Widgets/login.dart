import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/API/server.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';
import 'package:sreelethers_admin/Widgets/Utilities/loader.dart';
import 'package:sreelethers_admin/Widgets/Utilities/password_pop_up.dart';


class Login extends StatefulWidget
{
	const Login({ Key? key }) : super(key: key);

	@override
	_LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
{
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	final TextEditingController emailField =   TextEditingController();
	final TextEditingController passwordField =   TextEditingController();

 	PasswordPopup popup = new PasswordPopup();

	bool showPassword = false;

	Widget build(BuildContext context)
	{
		return Scaffold
		(
			body: SingleChildScrollView
			(
				padding: EdgeInsets.only(top: 50),
				child: Column
				(
					children:
					[
						logo(),
						form(context),
					],
				),
			)
		);
	}

	// logo
	Widget logo()
	{
		return Container
		(
			height: 200,
			width: 400	,
			child: Image.asset("assets/images/logo_splash.png"),
		);
	}

	// form
	Widget form(context)
	{
		return Container
		(
			width: double.infinity,
			margin: EdgeInsets.all(20),
			padding: EdgeInsets.all(10),
			decoration: BoxDecoration
			(
				border: Border.all(color: Color(int.parse("0xffE7EAF3"))),
				borderRadius: BorderRadius.circular(15)
			),
			child: Form
			(
				key: _formKey,
				child: Column
				(
					children:
					[
						Text
						(
							"Sign In",
							style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize(context, 20)),
						),
						SizedBox(height: 20),
						emailWidget(),
						SizedBox(height: 20),
						passwordWidget(),
						SizedBox(height: 3),
						forgotPassword(),
						rememberMe(),
						SizedBox(height: 20),
						signInButton(context),
					],
				)
			)
		);
	}

	Widget passwordWidget()
	{
		return TextFormField
		(
			controller: passwordField,
			decoration: InputDecoration
			(
				contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
				hintText: "8 + characters required",
				errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
				errorStyle: TextStyle(color: Colors.red),
				hintStyle: TextStyle(fontSize: 15.0, color: Colors.black38),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
				enabledBorder: OutlineInputBorder
				(
                	borderRadius: BorderRadius.circular(5.0),
                  	borderSide: BorderSide
					(
                    	color: Colors.black12,
                  	),
                ),
				suffixIcon: IconButton
				(
					icon: showPassword == false ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
					color: Colors.black45,
					onPressed: ()
					{
						setState(()
						{
							showPassword = !showPassword;
						});
					}
				)
			),
			obscureText: showPassword == true ? false : true,
			validator: (val)
			{
				if(val!.length == 0)
				{
					return "*Password cannot be empty";
				}
				if(val.length < 8)
				{
					return "Password is too short";
				}
				return null;
			},
			onSaved: (val) => passwordField.text = val.toString(),
		);
	}

	Widget emailWidget()
	{
		return TextFormField
		(
			controller: emailField,
			decoration: InputDecoration
			(
				contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
				hintText: "email@address.com",
				errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
				errorStyle: TextStyle(color: Colors.red),
				hintStyle: TextStyle(fontSize: 15.0, color: Colors.black38),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                enabledBorder: OutlineInputBorder
				(
                	borderRadius: BorderRadius.circular(5.0),
                  	borderSide: BorderSide
					(
                    	color: Colors.black12,
                  	),
                ),
			),
			keyboardType: TextInputType.emailAddress,
			validator: (val)
			{
				if(val!.length == 0)
				{
					return "*Email cannot be empty";
				}
				else
				{
					if (!val.contains('@'))
					{
						return 'Invalid Email';
					}
					else
					{
						return null;
					}
				}
			},
			onSaved: (val) => emailField.text = val.toString(),
		);
	}

	Widget rememberMe()
	{
		return Row
		(
			children:
			[
				Checkbox
				(
					value: false,
					onChanged: (value)
					{
						value = true;
					}
				),
				Text
				(
					"Remember Me",
					style: TextStyle(color: Colors.black45),
				)
			],
		);
	}

	Widget signInButton(context)
	{
		return Container
		(
			margin: EdgeInsets.only(bottom: 20),
			height: MediaQuery.of(context).size.height / 15,
			width: double.infinity,
			child: ElevatedButton
			(
				child: Text
				(
					"Sign In",
					style: TextStyle(fontSize: fontSize(context, 16))
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
					// Navigator.pushReplacementNamed(context, "dashboard");
					signIn();
				}
			)
		);
	}

	forgotPassword()
	{
		return Row
		(
			mainAxisAlignment: MainAxisAlignment.end,
			children:
			[
				GestureDetector
				(
					child: Text("Forgot Password", style: TextStyle(color: AppColors.appBarColor),),
					onTap: ()
					{
						popup.enterEmail(context);
						// passwordPopUp(context);
					},
				)
			],
		);
	}

	signIn() async
	{
		if(_formKey.currentState!.validate())
		{
			loader(context);

			var response = await Server.login(emailField.text, passwordField.text);

			if(response != false)
			{
				Navigator.pop(context);

				final snackBar = SnackBar(content: const Text('Success!'));
				ScaffoldMessenger.of(context).showSnackBar(snackBar);

				Navigator.pushReplacementNamed(context, "dashboard");
			}
			else
			{
				Navigator.pop(context);

				final snackBar = SnackBar(content: const Text('You are an unauthorised person'));
				ScaffoldMessenger.of(context).showSnackBar(snackBar);
			}
		}
	}
}