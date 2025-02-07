import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sreeleathers/data/model/body/register_model.dart';
import 'package:sreeleathers/localization/language_constrants.dart';
import 'package:sreeleathers/provider/auth_provider.dart';
import 'package:sreeleathers/provider/profile_provider.dart';
import 'package:sreeleathers/utill/color_resources.dart';
import 'package:sreeleathers/utill/custom_themes.dart';
import 'package:sreeleathers/utill/dimensions.dart';
import 'package:sreeleathers/utill/images.dart';
import 'package:sreeleathers/view/basewidget/button/custom_button.dart';
import 'package:sreeleathers/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:sreeleathers/view/basewidget/textfield/custom_textfield.dart';
import 'package:sreeleathers/view/screen/auth/otp_verification.dart';
import 'package:sreeleathers/view/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatefulWidget
{
	@override
	_SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
{
	TextEditingController _firstNameController = TextEditingController();
	TextEditingController _lastNameController = TextEditingController();
	TextEditingController _emailController = TextEditingController();
	TextEditingController _phoneController = TextEditingController();
	TextEditingController _passwordController = TextEditingController();
	TextEditingController _confirmPasswordController = TextEditingController();
	GlobalKey<FormState> _formKey;

	FocusNode _fNameFocus = FocusNode();
	FocusNode _lNameFocus = FocusNode();
	FocusNode _emailFocus = FocusNode();
	FocusNode _phoneFocus = FocusNode();
	FocusNode _passwordFocus = FocusNode();
	FocusNode _confirmPasswordFocus = FocusNode();

	RegisterModel register = RegisterModel();
	bool isEmailVerified = false;

	var result;

	bool _isLoggedIn = false;
  	Map _userObj = {};

  	addUser() async
	{
    	if (_formKey.currentState.validate())
		{
			_formKey.currentState.save();
			isEmailVerified = true;

			String _firstName = _firstNameController.text.trim();
			String _email = _emailController.text.trim();
			String _phone = _phoneController.text.trim();
			String _password = _passwordController.text.trim();
			String _confirmPassword = _confirmPasswordController.text.trim();

      		if (_firstName.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('NAME_FIELD_MUST_BE_REQUIRED', context)),
				backgroundColor: Colors.red));
      		}
			else if (_email.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          		backgroundColor: Colors.red));
      		}
			else if (_phone.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)),
          		backgroundColor: Colors.red));
      		}
			else if (_password.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          		backgroundColor: Colors.red));
      		}
			else if (_confirmPassword.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context)),
          		backgroundColor: Colors.red));
      		}
			else if (_password != _confirmPassword)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
          		backgroundColor: Colors.red));
      		}
			else
			{
				register.fName = '${_firstNameController.text}';
				register.lName = _lastNameController.text ?? " ";
				register.email = _emailController.text;
				register.phone = _phoneController.text;
				register.password = _passwordController.text;
				await Provider.of<AuthProvider>(context, listen: false).registration(register, route);
      		}
    	}
		else
		{
      		isEmailVerified = false;
    	}
  	}

  	route(bool isRoute, String errorMessage) async
	{
    	if (isRoute)
		{
      		result = await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);

      		// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);

			Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => OTPVerification(result, register.phone)), (route) => false);

			_emailController.clear();
			_passwordController.clear();
			_firstNameController.clear();
			_lastNameController.clear();
			_phoneController.clear();
			_confirmPasswordController.clear();
    	}
		else
		{
      		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    	}
  	}

	@override
	void initState()
	{
		super.initState();
		_formKey = GlobalKey<FormState>();
	}

	@override
	Widget build(BuildContext context)
	{
    	return ListView
		(
			padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
			children:
			[
				Form
				(
					key: _formKey,
					child: Column
					(
						children:
						[
							// for first and last name
							Container
							(
								margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT),
								child: Row
								(
									children:
									[
										Expanded
										(
											child: CustomTextField
											(
												hintText: getTranslated('FIRST_NAME', context),
												textInputType: TextInputType.name,
												focusNode: _fNameFocus,
												nextNode: _lNameFocus,
												isPhoneNumber: false,
												capitalization: TextCapitalization.words,
												controller: _firstNameController,
											)
										),
                    					SizedBox(width: 15),
                    					Expanded
										(
											child: CustomTextField
											(
												hintText: getTranslated('LAST_NAME', context),
												focusNode: _lNameFocus,
												nextNode: _emailFocus,
												capitalization: TextCapitalization.words,
												controller: _lastNameController,
											)
										),
									],
								),
							),

							// for email
							Container
							(
								margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
								child: CustomTextField
								(
									hintText: getTranslated('ENTER_YOUR_EMAIL', context),
									focusNode: _emailFocus,
									nextNode: _phoneFocus,
									textInputType: TextInputType.emailAddress,
									controller: _emailController,
								),
							),

							// for phone

							Container
							(
								margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
								child: CustomTextField
								(
									textInputType: TextInputType.number,
									hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
									focusNode: _phoneFocus,
									nextNode: _passwordFocus,
									controller: _phoneController,
									isPhoneNumber: true,
								),
							),

							// for password
							Container
							(
								margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
								child: CustomPasswordTextField
								(
									hintTxt: getTranslated('PASSWORD', context),
									controller: _passwordController,
									focusNode: _passwordFocus,
									nextNode: _confirmPasswordFocus,
									textInputAction: TextInputAction.next,
								),
							),

							// for re-enter password
							Container
							(
								margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
								child: CustomPasswordTextField
								(
									hintTxt: getTranslated('RE_ENTER_PASSWORD', context),
									controller: _confirmPasswordController,
									focusNode: _confirmPasswordFocus,
									textInputAction: TextInputAction.done,
								),
							),
            			],
          			),
        		),

				// for register button
				Container
				(
					margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
					child: Provider.of<AuthProvider>(context).isLoading
						? Center
						(
							child: CircularProgressIndicator
							(
								valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
							),
						)
						: CustomButton(onTap: addUser, buttonText: getTranslated('SIGN_UP', context)),
				),

				Center(child: Text("Or Sign Up With", style: titilliumRegular.copyWith(fontSize: 12))),
          		SizedBox(height: 20),
				// social media icons
				Row
				(
					mainAxisAlignment: MainAxisAlignment.center,
					children:
					[
						GestureDetector
						(
							child: Container
							(
								padding: EdgeInsets.all(10),
								decoration: BoxDecoration
								(
									borderRadius: BorderRadius.circular(25),
									color: Colors.black12
								),
								child: Image.asset
								(
									Images.facebook_logo,
									height: 20,
								)
							),
							onTap: () =>
							{
								FacebookAuth.instance.login
								(
									permissions: ["public_profile", "email"]).then((value)
									{
										FacebookAuth.instance.getUserData().then((userData)
										{
											setState(()
											{
												_isLoggedIn = true;
												_userObj = userData;

												print(userData);
												print("USERDATA");
											});
										});
									},
								),
							}
						),
						SizedBox(width: 70),
						GestureDetector
						(
							child: Container
							(
								padding: EdgeInsets.all(10),
								decoration: BoxDecoration
								(
									borderRadius: BorderRadius.circular(25),
									color: Colors.black12
								),
								child: Image.asset
								(
									Images.google_logo,
									height: 20,
								)
							),
							onTap: ()
							{
								login();
							},
						)
					],
				),

				// for skip for now
				Provider.of<AuthProvider>(context).isLoading
				? SizedBox()
				: Center
				(
					child: TextButton
					(
						onPressed: ()
						{
							Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
						},
						child: Text
						(
							getTranslated('SKIP_FOR_NOW', context),
							style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getColombiaBlue(context))
						),
					)
				)
      		]
    	);
  	}

	void login() async
	{
  		GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  		_googleSignIn.signIn().then((GoogleSignInAccount acc) async
		{
    		GoogleSignInAuthentication auth = await acc.authentication;
			print(acc.id);
			print(acc.email);
			print(acc.displayName);
			print(acc.photoUrl);

    		acc.authentication.then((GoogleSignInAuthentication auth) async
			{
				print(auth.idToken);
				print(auth.accessToken);
    		});
  		});
	}
}
