import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/API/server.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/loader.dart';
import 'package:sreelethers_admin/Widgets/Utilities/textForm.dart';

class PasswordPopup
{
	TextEditingController emailController = new TextEditingController();
	TextEditingController otpController = new TextEditingController();
	TextEditingController passwordController = new TextEditingController();
	TextEditingController confirmPasswordController = new TextEditingController();

	int adminId = 0;

	enterEmail(context)
	{
		AlertDialog alert = AlertDialog
		(
			backgroundColor: Color(int.parse("0xffF6F6F6")),
			content: StatefulBuilder
			(
				builder: (BuildContext context, StateSetter setState)
				{
					return  Column
					(
						mainAxisAlignment: MainAxisAlignment.center,
						mainAxisSize: MainAxisSize.min,
						children: <Widget>
						[
							SizedBox(height: 30),
							Text
							(
								"Enter your email\n",
								style: TextStyle
								(
									fontWeight: FontWeight.bold
								),
								textAlign: TextAlign.center,
							),
							TextFormField
							(
								controller: emailController,
								onSaved: (value)
								{
									emailController.text = value!;
								},
							),
							SizedBox(height: 20),
							TextButton
							(
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appBarColor)),
								onPressed: ()
								{
									sentEmail(context);
								},
								child: Padding
								(
									padding: EdgeInsets.all(1),
									child: Text("OK", style: TextStyle
									(
										color: Colors.white,
										fontWeight: FontWeight.bold
									),
								))
							)
						]
					);
				}
			)
		);

		showDialog
		(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context)
			{
				return alert;
			}
		);
	}

	enterOtp(context)
	{
		AlertDialog alert = AlertDialog
		(
			backgroundColor: Color(int.parse("0xffF6F6F6")),
			content: StatefulBuilder
			(
				builder: (BuildContext context, StateSetter setState)
				{
					return  Column
					(
						mainAxisAlignment: MainAxisAlignment.center,
						mainAxisSize: MainAxisSize.min,
						children: <Widget>
						[
							SizedBox(height: 30),
							Text
							(
								"Enter the OTP send to your email\n",
								style: TextStyle
								(
									fontWeight: FontWeight.bold
								),
								textAlign: TextAlign.center,
							),
							TextFormField
							(
								keyboardType: TextInputType.number,
								controller: otpController,
								onSaved: (value)
								{
									otpController.text = value!;
								},
							),
							SizedBox(height: 20),
							TextButton
							(
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appBarColor)),
								onPressed: ()
								{
									submitOTP(context);
								},
								child: Padding
								(
									padding: EdgeInsets.all(1),
									child: Text("OK", style: TextStyle
									(
										color: Colors.white,
										fontWeight: FontWeight.bold
									),
								))
							)
						]
					);
				}
			)
		);

		showDialog
		(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context)
			{
				return alert;
			}
		);
	}

	enterPassword(context)
	{
		AlertDialog alert = AlertDialog
		(
			backgroundColor: Color(int.parse("0xffF6F6F6")),
			content: StatefulBuilder
			(
				builder: (BuildContext context, StateSetter setState)
				{
					return  Column
					(
						mainAxisAlignment: MainAxisAlignment.center,
						mainAxisSize: MainAxisSize.min,
						children: <Widget>
						[
							SizedBox(height: 30),
							Text
							(
								"Enter new password\n",
								style: TextStyle
								(
									fontWeight: FontWeight.bold
								),
								textAlign: TextAlign.center,
							),
							TextFormField
							(
								controller: passwordController,
								onSaved: (value)
								{
									passwordController.text = value!;
								},
							),
							TextFormField
							(
								controller: confirmPasswordController,
								onSaved: (value)
								{
									confirmPasswordController.text = value!;
								},
							),
							SizedBox(height: 20),
							TextButton
							(
								style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appBarColor)),
								onPressed: ()
								{
									submitPassword(context);
								},
								child: Padding
								(
									padding: EdgeInsets.all(1),
									child: Text("OK", style: TextStyle
									(
										color: Colors.white,
										fontWeight: FontWeight.bold
									),
								))
							)
						]
					);
				}
			)
		);

		showDialog
		(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context)
			{
				return alert;
			}
		);
	}

	sentEmail(context) async
	{
		var response = await Server.sentEmail(emailController.text);

		Navigator.pop(context);

		if(response == false)
		{
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Email")));
		}
		else
		{
			enterOtp(context);
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your OTP is: " + response["otp"].toString())));
		}
	}

	submitOTP(context) async
	{
		var response = await Server.submitOtp(otpController.text, adminId);

		Navigator.pop(context);

		print(response);

		if(response == false)
		{
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oh its the wrong one!!!")));
		}
		else
		{
			enterPassword(context);
		}
	}

	submitPassword(context) async
	{	
		var response = await Server.passwordReset(passwordController.text, confirmPasswordController.text , adminId);

		Navigator.pop(context);

		if(response == false)
		{
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Oh its the wrong one!!!")));
		}
		else
		{
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Got it!!!")));
		}
	}
}