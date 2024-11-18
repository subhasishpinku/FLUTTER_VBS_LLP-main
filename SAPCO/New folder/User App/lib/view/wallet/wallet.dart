import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreeleathers/data/datasource/remote/dio/dio_client.dart';
import 'package:sreeleathers/data/datasource/remote/exception/api_error_handler.dart';
import 'package:sreeleathers/data/model/response/base/api_response.dart';
import 'package:sreeleathers/data/model/response/user_info_model.dart';
import 'package:sreeleathers/data/repository/profile_repo.dart';
import 'package:sreeleathers/localization/language_constrants.dart';
import 'package:sreeleathers/provider/profile_provider.dart';
import 'package:sreeleathers/provider/splash_provider.dart';
import 'package:sreeleathers/utill/app_constants.dart';
import 'package:sreeleathers/utill/custom_themes.dart';
import 'package:sreeleathers/utill/dimensions.dart';
import 'package:sreeleathers/utill/images.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class WalletScreen extends StatefulWidget
{
	@override
	_WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
{
	var customerInfo;
	bool loading = true;

	UserInfoModel userInfoModel;
	DioClient dioClient;

	var result;

	String baseUrl = "https://development.lifeproductions.in/sreelathers/api/v1/";

	@override
	void initState()
	{
		super.initState();
		getWallet();
		// getUserInformation();
	}

	@override
	Widget build(BuildContext context)
	{
    	// result = Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);

		print(result.toString());

		// getUserInformation();
		// getWallet();

    	return WillPopScope
		(
      		onWillPop: ()
			{
        		Provider.of<SplashProvider>(context, listen: false).setFromSetting(false);
        		return Future.value(true);
      		},
      		child: Scaffold
			(
				appBar: AppBar
				(
					leading: IconButton
					(
						icon: Icon(Icons.arrow_back_ios),
						onPressed: ()
						{
							Navigator.pop(context);
						},
					),
					title: Text(getTranslated("wallet", context)),
				),
				body: loading
				? Center
				(
					child: CircularProgressIndicator
					(
						valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
					)
				)
				: walletImage()
    		)
		);
  	}

	Widget walletImage()
	{
		return Column
		(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children:
			[
				Expanded
				(
					child: ListView
					(
						padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
						children:
						[
							Container
							(
								margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
								padding: EdgeInsets.all(10),
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
													Images.wallet_gift,
													height: 110,
												),
											),
											Padding
											(
												padding: EdgeInsets.only(top: 3),
												child: Text
												(
													"Hello,",
													textAlign: TextAlign.center,
												)
											),
											Padding
											(
												padding: EdgeInsets.only(top: 3),
												child: Text
												(
													result["response"]["username"],
													textAlign: TextAlign.center,
												)
											),
											Padding
											(
												padding: EdgeInsets.only(top: 3),
												child: Row
												(
													mainAxisAlignment: MainAxisAlignment.center,
													children:
													[
														Image.asset(Images.rupee_symbol, height: 13, width: 13),
														Text
														(
															result["response"]["balance"],
															textAlign: TextAlign.center,
															style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
														)
													],
												)
											),
											Padding
											(
												padding: EdgeInsets.only(top: 3, bottom: 10),
												child: Text
												(
													"Available in your wallet",
													textAlign: TextAlign.center,
												)
											),
										],
									)
								)
							)
						]
					)
				),
				Padding
				(
					padding: EdgeInsets.only(left: 10),
					child: Align
					(
						alignment: Alignment.topLeft,
						child: Text("Payment Methods", style: TextStyle(fontSize: 20)),
					),
				),
				Container
				(
					height: 200,
					child: ListView.builder
					(
						itemCount: 2,
						itemBuilder: (BuildContext context, int index)
						{
							return Column
							(
								children:
								[
									ListTile
									(
										leading: Image.asset(Images.visa, height: 15, width: 15),
										title: Text("*****8858 (India)", style: titilliumBold,),
										trailing: Icon(Icons.keyboard_arrow_right),
									),
									ListTile
									(
										leading: Image.asset(Images.add_payment, height: 10, width: 10),
										title: Text("Add payment method", style: titilliumBold,),
									),
								],
							);
						}
					),
				)
			]
		);
	}

	getWallet() async
	{
		var id =  await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);

		print(id);
		print("result");

		var endPoint = baseUrl + "order/wallet-info?userId=" + id.toString();

		var response = await http.get(Uri.parse(endPoint));

		print(response.body);

		var data = jsonDecode(response.body);

		if(data["status"] == true)
		{
			result = data;

			setState(()
			{
				loading = false;
			});
		}
		else
		{
			ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wallet is empty"), backgroundColor: Colors.red));
		}
	}

	getUserInformation() async
	{
		var endPoint = baseUrl + "customer/info";

		try
		{
			var response = await http.get(Uri.parse(endPoint));

			print(response.body);

			var data = jsonDecode(response.body);

			print(data);
			print("DATAAAAA");
		}
		catch (e)
		{
			return ApiResponse.withError(ApiErrorHandler.getMessage(e));
		}
	}
}