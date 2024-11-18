import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sreeleathers/data/model/body/login_model.dart';
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
import 'package:sreeleathers/view/screen/auth/forget_password_screen.dart';
import 'package:sreeleathers/view/screen/dashboard/dashboard_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;




class SignInWidget extends StatefulWidget
{
	@override
	_SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget>
{
	TextEditingController _emailController;
	TextEditingController _passwordController;
	GlobalKey<FormState> _formKeyLogin;

	bool _isLoggedIn = false;
  	Map _userObj = {};

  	@override
  	void initState()
	{
		super.initState();
		_formKeyLogin = GlobalKey<FormState>();

		_emailController = TextEditingController();
		_passwordController = TextEditingController();

		_emailController.text = Provider.of<AuthProvider>(context, listen: false).getUserEmail() ?? null;
		_passwordController.text = Provider.of<AuthProvider>(context, listen: false).getUserPassword() ?? null;
  	}

	@override
	void dispose()
	{
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	FocusNode _emailNode = FocusNode();
	FocusNode _passNode = FocusNode();
	LoginModel loginBody = LoginModel();

  	void loginUser() async
	{
    	if (_formKeyLogin.currentState.validate())
		{
      		_formKeyLogin.currentState.save();

			String _email = _emailController.text.trim();
			String _password = _passwordController.text.trim();

			if (_email.isEmpty)
			{
				ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
				backgroundColor: Colors.red));
			}
			else if (_password.isEmpty)
			{
        		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          		backgroundColor: Colors.red));
      		}
			else
			{
				if (Provider.of<AuthProvider>(context, listen: false).isRemember)
				{
					Provider.of<AuthProvider>(context, listen: false).saveUserEmail(_email, _password);
				}
				else
				{
					Provider.of<AuthProvider>(context, listen: false).clearUserEmailAndPassword();
				}

				loginBody.email = _email;
				loginBody.password = _password;
				await Provider.of<AuthProvider>(context, listen: false).login(loginBody, route);
      		}
    	}
  	}

  	route(bool isRoute, String errorMessage) async
	{
    	if (isRoute)
		{
      		await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
      		Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
    	}
		else
		{
      		ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    	}
  	}

  	@override
  	Widget build(BuildContext context)
	{
    	Provider.of<AuthProvider>(context, listen: false).isRemember;

    	return Form
		(
			key: _formKeyLogin,
			child: ListView
			(
				padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
				children:
				[
					// for Email
					Container
					(
						margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE, bottom: Dimensions.MARGIN_SIZE_SMALL),
						child: CustomTextField
						(
							hintText: getTranslated('ENTER_YOUR_EMAIL', context),
							focusNode: _emailNode,
							nextNode: _passNode,
							textInputType: TextInputType.emailAddress,
							controller: _emailController,
						)
					),

				// for Password
					Container
					(
						margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE, bottom: Dimensions.MARGIN_SIZE_DEFAULT),
						child: CustomPasswordTextField
						(
							hintTxt: getTranslated('ENTER_YOUR_PASSWORD', context),
							textInputAction: TextInputAction.done,
							focusNode: _passNode,
							controller: _passwordController,
						)
					),

					// for remember and forgetpassword
					Container
					(
						margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_SMALL, right: Dimensions.MARGIN_SIZE_SMALL),
						child: Row
						(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children:
							[
								Row
								(
									children:
									[
										Consumer<AuthProvider>
										(
											builder: (context, authProvider, child) => Checkbox
											(
												checkColor: ColorResources.WHITE,
												activeColor: ColorResources.COLOR_PRIMARY,
												value: authProvider.isRemember,
												onChanged: authProvider.updateRemember,
											),
										),
										Text(getTranslated('REMEMBER', context), style: titilliumRegular),
									],
								),
								InkWell
								(
									onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordScreen())),
									// onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OTPVerification())),
									child: Text(getTranslated('FORGET_PASSWORD', context), style: titilliumRegular.copyWith(color: ColorResources.getLightSkyBlue(context))),
								),
							],
						),
					),

					// for signin button
					Container
					(
						margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
						child: Provider.of<AuthProvider>(context).isLoading
							? Center
							(
								child: CircularProgressIndicator
								(
									valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
								),
							)
							: CustomButton(onTap: loginUser, buttonText: getTranslated('SIGN_IN', context)),
					),

          			Center(child: Text("Sign in With", style: titilliumRegular.copyWith(fontSize: 12))),
          			SizedBox(height: 10),
					// social media icons
					Row
					(
						mainAxisAlignment: MainAxisAlignment.center,
						children:
						[
							InkWell
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
								onTap: () async
								{
									AccessToken accessToken = await FacebookAuth.getInstance().accessToken;

									print("TOKEN");

									print(accessToken.token);

									print(accessToken.toString());

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

													print(_userObj);
													print("USERDATA");
												});
											});
										},
									);
								}
							),
          					SizedBox(width: 70),
							InkWell
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

          			SizedBox(height: 10),
          			Center(child: Text(getTranslated('OR', context), style: titilliumRegular.copyWith(fontSize: 12))),

					//for order as guest
					GestureDetector
					(
						onTap: ()
						{
							if (!Provider.of<AuthProvider>(context, listen: false).isLoading)
							{
								Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
							}
						},
            			child: Container
						(
							margin: EdgeInsets.only(left: 50, right: 50, top: 20),
							width: double.infinity,
							height: 40,
							alignment: Alignment.center,
							decoration: BoxDecoration
							(
								color: Colors.transparent,
								borderRadius: BorderRadius.circular(6),
								border: Border.all(color: ColorResources.getHint(context), width: 1.0),
              				),
              				child: Text(getTranslated('CONTINUE_AS_GUEST', context), style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context))),
            			),
          			),
        		],
      		),
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
