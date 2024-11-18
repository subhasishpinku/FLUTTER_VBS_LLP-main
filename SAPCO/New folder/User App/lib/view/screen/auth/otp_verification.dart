import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sreeleathers/localization/language_constrants.dart';
import 'package:sreeleathers/provider/auth_provider.dart';
import 'package:sreeleathers/provider/theme_provider.dart';
import 'package:sreeleathers/utill/color_resources.dart';
import 'package:sreeleathers/utill/custom_themes.dart';
import 'package:sreeleathers/utill/dimensions.dart';
import 'package:sreeleathers/utill/images.dart';
import 'package:provider/provider.dart';
import 'package:sreeleathers/view/screen/dashboard/dashboard_screen.dart';

class OTPVerification extends StatefulWidget
{
	final userId;
	final phone;

	OTPVerification(this.userId, this.phone);

	@override
	_OTPVerificationState createState() => _OTPVerificationState(this.userId, this.phone);
}


class _OTPVerificationState extends State<OTPVerification>
{
	final userId;
	final phone;

	_OTPVerificationState(this.userId, this.phone);

	final TextEditingController _controller = TextEditingController();
	final GlobalKey<ScaffoldMessengerState> _key = GlobalKey();

	var otpEntered = "";

	final focus = FocusNode();
	final focus1 = FocusNode();
	final focus2 = FocusNode();
	final focus3 = FocusNode();
	final focus4 = FocusNode();
	final focus5 = FocusNode();

	var f1Controller = TextEditingController();
	var f2Controller = TextEditingController();
	var f3Controller = TextEditingController();
	var f4Controller = TextEditingController();
	var f5Controller = TextEditingController();
	var f6Controller = TextEditingController();

	String baseUrl = "https://sapcotechnologies.com/sree/api/v1/auth/";
	var result;
	var code;

	Timer _timer;
	int _start = 20;

	@override
	void initState()
	{
		super.initState();
		sendOTP();
		startTimer();
		// reteriveSms();
	}

	@override
	void dispose()
	{
		_timer.cancel();
		super.dispose();
		// reteriveSms();
	}

  	@override
  	Widget build(BuildContext context)
	{
    	return Scaffold
		(
      		key: _key,
			body: Container
			(
				decoration: BoxDecoration
				(
					image: Provider.of<ThemeProvider>(context).darkTheme ? null : DecorationImage(image: AssetImage(Images.background), fit: BoxFit.fill),
				),
        		child: Column
				(
          			children:
					[
						SafeArea
						(
							child: Align
							(
								alignment: Alignment.centerLeft,
								child: IconButton
								(
									icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.blue),
									onPressed: () => Navigator.pop(context),
								),
							)
						),
            			Expanded
						(
              				child: ListView
							(
								padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
								children:
								[
									Container
									(
										margin: EdgeInsets.only(left: 30, right: 30),
										padding: EdgeInsets.all(20),
										child: Material
										(
											borderRadius: BorderRadius.circular(10),
											elevation: 5,
											child: Column
											(
												children:
												[
													Padding
													(
														padding: EdgeInsets.all(10),
														child: Image.asset
														(
															Images.otp_verification,
															height: 110,
														),
													),
													Padding
													(
														padding: EdgeInsets.all(10),
														child: Text
														(
															"Waiting to automatically detect an sms sent to your mobile number.",
															textAlign: TextAlign.center,
														)
													),
													Row
													(
														mainAxisAlignment: MainAxisAlignment.center,
														children:
														[
															Padding
															(
																padding: EdgeInsets.all(10),
																child: Text
																(
																	this.phone.toString(),
																	style: titilliumBold,
																	textAlign: TextAlign.center,
																)
															),
															Icon(Icons.edit, color: Colors.blue)
														],
													)
												],
											)
										),
									),
									Center
									(
										child: Text
										(
											"Enter 4 Digit Code"
										),
									),
									otpInputField(context),
									SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

									Center
									(
										child: GestureDetector
										(
											child: RichText
											(
												text: TextSpan
												(
													children:
													[
														TextSpan
														(
															text: "Didn't get the code? ",
															style: TextStyle(color: Colors.black)
														),
														TextSpan
														(
															text: "Resend Code.",
															style: TextStyle(color: _start == 0 ? Colors.blue : Colors.grey)
														),
													]
												)
											),
											onTap: ()
											{
												_start == 0 ? sendOTP() : null;
											},
										)
									),
									SizedBox(height: 20),
									Builder
									(
										builder: (context) => !Provider.of<AuthProvider>(context).isLoading
										?
										TextButton
										(
      										onPressed: ()
											{
												verifyOTP();
											},
											style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
											child: Container
											(
												height: 45,
												alignment: Alignment.center,
												decoration: BoxDecoration(
												color: ColorResources.getChatIcon(context),
												boxShadow: [
												BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
												],
												gradient:  LinearGradient(colors: [
												Theme.of(context).primaryColor,
												ColorResources.getBlue(context),
												ColorResources.getBlue(context),
												]),
												borderRadius: BorderRadius.circular(10)),
												child: Text
												(
													_start.toString() + " Seconds",
													style: titilliumSemiBold.copyWith(
													fontSize: 16,
													color: Theme.of(context).accentColor,
												)),
											),
											)
										: Center
										(
											child: CircularProgressIndicator
											(
												valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
											)
										),
									)
								]
							)
            			)
          			]
        		)
      		)
    	);
  	}

	otpInputField(context)
	{
		return Container
		(
			padding: EdgeInsets.only(top:10),
			child: Row
			(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children:
				[
					Container
					(
						color: Colors.white,
						height: 50,
						width: 38,
						margin: EdgeInsets.only(right:2, bottom:10),
						child: TextFormField
						(
							style: TextStyle(fontSize: 18, color: Colors.black),
							controller: f1Controller,
							textInputAction: TextInputAction.next,
							textAlign: TextAlign.center,
							maxLength: 1,
							focusNode: focus,
							decoration: InputDecoration
							(
								counterText: ''
							),
							keyboardType: TextInputType.number,
							onChanged: (v)
							{
								editOtp();

								if (v.length == 0)
								{

								}
								else
								{
									FocusScope.of(context).requestFocus(focus1);
								}
							},
						),
					),
					Container
					(
						color: Colors.white,
						height: 50,
						width: 38,
						margin: EdgeInsets.only(right:2, bottom:10),
						child: TextFormField
						(
							style: TextStyle(fontSize: 18, color: Colors.black),
							controller: f2Controller,
							textInputAction: TextInputAction.next,
							focusNode: focus1,
							textAlign: TextAlign.center,
							maxLength: 1,
							decoration: InputDecoration
							(
								counterText: ''
							),
							keyboardType: TextInputType.number,
							onChanged: (v)
							{
								editOtp();

								if (v.length == 0)
								{
									FocusScope.of(context).requestFocus(focus);
								}
								else
								{
									FocusScope.of(context).requestFocus(focus2);
								}
							},
						),
					),
					Container
					(
						color: Colors.white,
						height: 50,
						width: 38,
						margin: EdgeInsets.only(right:2, bottom:10),
						child: TextFormField
						(
							style: TextStyle(fontSize: 18, color: Colors.black),
							controller: f3Controller,
							textInputAction: TextInputAction.next,
							focusNode: focus2,
							keyboardType: TextInputType.number,
							textAlign: TextAlign.center,
							maxLength: 1,
							decoration: InputDecoration
							(
								counterText: ''
							),
							onChanged: (v)
							{
								editOtp();

								if (v.length == 0)
								{
									FocusScope.of(context).requestFocus(focus1);
								}
								else
								{
									FocusScope.of(context).requestFocus(focus3);
								}
							}
						),
					),
					Container
					(
						color: Colors.white,
						height: 50,
						width: 38,
						margin: EdgeInsets.only(right:2, bottom:10),
						child: TextFormField
						(
							style: TextStyle(fontSize: 18, color: Colors.black),
							controller: f4Controller,
							textInputAction: TextInputAction.next,
							focusNode: focus3,
							keyboardType: TextInputType.number,
							textAlign: TextAlign.center,
							maxLength: 1,
							decoration: InputDecoration
							(
								counterText: ''
							),
							onChanged: (v)
							{
								editOtp();

								if (v.length == 0)
								{
									FocusScope.of(context).requestFocus(focus2);
								}
								else
								{
									FocusScope.of(context).requestFocus(focus4);
								}
							}
						),
					),
					// Container
					// (
					// 	color: Colors.white,
					// 	height: 50,
					// 	width: 38,
					// 	margin: EdgeInsets.only(right:2, bottom:10),
					// 	child: TextFormField
					// 	(
					// 		style: TextStyle(fontSize: 18, color: Colors.black),
					// 		controller: f5Controller,
					// 		textInputAction: TextInputAction.next,
					// 		focusNode: focus4,
					// 		keyboardType: TextInputType.number,
					// 		textAlign: TextAlign.center,
					// 		maxLength: 1,
					// 		decoration: InputDecoration
					// 		(
					// 			counterText: ''
					// 		),
					// 		onChanged: (v)
					// 		{
					// 			editOtp();

					// 			if (v.length == 0)
					// 			{
					// 				FocusScope.of(context).requestFocus(focus3);
					// 			}
					// 			else
					// 			{
					// 				FocusScope.of(context).requestFocus(focus5);
					// 			}
					// 		}
					// 	),
					// ),
					// Container
					// (
					// 	color: Colors.white,
					// 	height: 50,
					// 	width: 38,
					// 	margin: EdgeInsets.only(right:2, bottom:10),
					// 	child: TextFormField
					// 	(
					// 		style: TextStyle(fontSize: 18, color: Colors.black),
					// 		controller: f6Controller,
					// 		textInputAction: TextInputAction.next,
					// 		focusNode: focus5,
					// 		keyboardType: TextInputType.number,
					// 		textAlign: TextAlign.center,
					// 		maxLength: 1,
					// 		decoration: InputDecoration
					// 		(
					// 			counterText: ''
					// 		),
					// 		onChanged: (v)
					// 		{
					// 			editOtp();

					// 			if (v.length == 0)
					// 			{
					// 				FocusScope.of(context).requestFocus(focus4);
					// 			}
					// 			else
					// 			{

					// 			}
					// 		}
					// 	),
					// )
				],
			),
		);
	}


	void startTimer()
	{
		_start = 20;
  		const oneSec = const Duration(seconds: 1);

  		_timer = new Timer.periodic(oneSec, (Timer timer)
		{
      		if (_start == 0)
			{
        		setState(()
				{
          			_timer.cancel();
        		});
      		}
			else
			{
        		setState(()
				{
          			_start--;
        		});
      		}
    	},);
	}


	editOtp()
	{
		code = f1Controller.text + f2Controller.text + f3Controller.text + f4Controller.text + f5Controller.text + f6Controller.text;

		// setState(()
		// {
			// isOtpEntered = code.length == 6 ? true : false;
			otpEntered = code;
		// });
	}

	sendOTP() async
	{
		var endPoint = baseUrl + "otp-login";

		print(this.phone);

		var response = await http.post(Uri.parse(endPoint),
		body:
		{
			"phone": this.phone
		});

		print(response.body);

		result = jsonDecode(response.body);

		print(result);
	}

	verifyOTP() async
	{
		print(this.userId);

		var endPoint = baseUrl + "otp-login-verification";

		var response = await http.post(Uri.parse(endPoint),
		body:
		{
			"userId": this.userId,
			"otp": code
		});

		print(response.body);

		result = jsonDecode(response.body);

		if(result["status"] == true)
		{
			Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
		}
		else
		{
      		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP"), backgroundColor: Colors.red));
    	}
	}
}
