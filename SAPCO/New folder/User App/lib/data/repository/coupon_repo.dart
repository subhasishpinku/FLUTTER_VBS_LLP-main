import 'package:flutter/material.dart';
import 'package:sreeleathers/data/datasource/remote/dio/dio_client.dart';
import 'package:sreeleathers/data/datasource/remote/exception/api_error_handler.dart';
import 'package:sreeleathers/data/model/response/base/api_response.dart';
import 'package:sreeleathers/utill/app_constants.dart';

class CouponRepo
{
	final DioClient dioClient;
	CouponRepo({@required this.dioClient});

	Future<ApiResponse> getCoupon(String coupon) async
	{
		try
		{
			final response = await dioClient.get('${AppConstants.COUPON_URI}$coupon');
			return ApiResponse.withSuccess(response);
		}
		catch (e)
		{
			return ApiResponse.withError(ApiErrorHandler.getMessage(e));
		}
	}
}