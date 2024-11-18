import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tipstugas/API.dart';
class Server
{
	static premiumTips() async
	{
		try
		{
			var response = await http.get(Uri.parse(API.premiumTips));
			var responseJson = jsonDecode(response.body);
			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}
	static freeTips() async
	{
		print(API.freeTips);
		try
		{
			var response = await http.get(Uri.parse(API.freeTips));
			var responseJson = jsonDecode(response.body);
			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static strategyTips() async
	{
		try
		{
			var response = await http.get(Uri.parse(API.strategyTips));
			var responseJson = jsonDecode(response.body);
			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static resumoTips() async
	{
		try
		{
			var response = await http.get(Uri.parse(API.resumoTips));

			var responseJson = jsonDecode(response.body);

			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static images() async
	{
		try
		{
			var response = await http.get(Uri.parse(API.images));

			var responseJson = jsonDecode(response.body);

			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static login(email, username, token) async
	{
		try
		{
			var response = await http.post
			(
				Uri.parse(API.login),
				body:
				{
					"email": email,
					"username": username,
					"token": token
				}
			);

			var responseJson = jsonDecode(response.body);

			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static fetchSubscription(email) async
	{
		print(email);
		
		final Map<String, dynamic>  data = {"email": email.toString()};
		try
		{
			var response = await http.post
			(
				Uri.parse(API.getSubscriptionDetails),
				body: convert.jsonEncode(data)
			);

			var responseJson = jsonDecode(response.body);

			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}

	static savePurchase(email, date, productId, token, days, orderId) async
	{
		Map<String, dynamic> data =
		{
			"email": email,
			"purchase_date": date,
			"productId": productId,
			"purchase_token": token,
			"number_of_days": days,
			"orderId": orderId
		};

		try
		{
			var response = await http.post
			(
				Uri.parse(API.savePurchase),
				body: convert.jsonEncode(data)
			);

			var responseJson = jsonDecode(response.body);

			return responseJson;
		}
		catch(e)
		{
			return false;
		}
	}
}