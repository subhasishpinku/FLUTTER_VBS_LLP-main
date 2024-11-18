import 'package:flutter/material.dart';
import 'package:sreeleathers/data/datasource/remote/dio/dio_client.dart';
import 'package:sreeleathers/data/datasource/remote/exception/api_error_handler.dart';
import 'package:sreeleathers/data/model/response/base/api_response.dart';
import 'package:sreeleathers/utill/app_constants.dart';

class BannerRepo
{
	final DioClient dioClient;
	BannerRepo({@required this.dioClient});

	Future<ApiResponse> getBannerList() async
	{
		try
		{
			final response = await dioClient.get(AppConstants.MAIN_BANNER_URI);
			return ApiResponse.withSuccess(response);
		}
		catch (e)
		{
			return ApiResponse.withError(ApiErrorHandler.getMessage(e));
		}
	}

	Future<ApiResponse> getFooterBannerList() async
	{
		try
		{
			final response = await dioClient.get(AppConstants.FOOTER_BANNER_URI);
			return ApiResponse.withSuccess(response);
		}
		catch (e)
		{
			return ApiResponse.withError(ApiErrorHandler.getMessage(e));
		}
	}
}