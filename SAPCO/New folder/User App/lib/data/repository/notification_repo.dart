import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sreeleathers/data/datasource/remote/dio/dio_client.dart';
import 'package:sreeleathers/data/datasource/remote/exception/api_error_handler.dart';
import 'package:sreeleathers/data/model/response/base/api_response.dart';
import 'package:sreeleathers/utill/app_constants.dart';

class NotificationRepo
{
	final DioClient dioClient;
	NotificationRepo({@required this.dioClient});

	Future<ApiResponse> getNotificationList() async
	{
		try
		{
			Response response = await dioClient.get(AppConstants.NOTIFICATION_URI);
			return ApiResponse.withSuccess(response);
		}
		catch (e)
		{
			return ApiResponse.withError(ApiErrorHandler.getMessage(e));
		}
	}
}