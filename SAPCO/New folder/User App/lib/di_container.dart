import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:sreeleathers/data/datasource/remote/dio/dio_client.dart';
import 'package:sreeleathers/data/repository/auth_repo.dart';
import 'package:sreeleathers/data/repository/banner_repo.dart';
import 'package:sreeleathers/data/repository/brand_repo.dart';
import 'package:sreeleathers/data/repository/cart_repo.dart';
import 'package:sreeleathers/data/repository/category_repo.dart';
import 'package:sreeleathers/data/repository/chat_repo.dart';
import 'package:sreeleathers/data/repository/coupon_repo.dart';
import 'package:sreeleathers/data/repository/flash_deal_repo.dart';
import 'package:sreeleathers/data/repository/notification_repo.dart';
import 'package:sreeleathers/data/repository/onboarding_repo.dart';
import 'package:sreeleathers/data/repository/product_details_repo.dart';
import 'package:sreeleathers/data/repository/order_repo.dart';
import 'package:sreeleathers/data/repository/product_repo.dart';
import 'package:sreeleathers/data/repository/profile_repo.dart';
import 'package:sreeleathers/data/repository/search_repo.dart';
import 'package:sreeleathers/data/repository/seller_repo.dart';
import 'package:sreeleathers/data/repository/splash_repo.dart';
import 'package:sreeleathers/data/repository/support_ticket_repo.dart';
import 'package:sreeleathers/data/repository/wishlist_repo.dart';
import 'package:sreeleathers/helper/network_info.dart';
import 'package:sreeleathers/provider/auth_provider.dart';
import 'package:sreeleathers/provider/banner_provider.dart';
import 'package:sreeleathers/provider/brand_provider.dart';
import 'package:sreeleathers/provider/cart_provider.dart';
import 'package:sreeleathers/provider/category_provider.dart';
import 'package:sreeleathers/provider/chat_provider.dart';
import 'package:sreeleathers/provider/coupon_provider.dart';
import 'package:sreeleathers/provider/flash_deal_provider.dart';
import 'package:sreeleathers/provider/localization_provider.dart';
import 'package:sreeleathers/provider/notification_provider.dart';
import 'package:sreeleathers/provider/onboarding_provider.dart';
import 'package:sreeleathers/provider/product_details_provider.dart';
import 'package:sreeleathers/provider/order_provider.dart';
import 'package:sreeleathers/provider/product_provider.dart';
import 'package:sreeleathers/provider/profile_provider.dart';
import 'package:sreeleathers/provider/search_provider.dart';
import 'package:sreeleathers/provider/seller_provider.dart';
import 'package:sreeleathers/provider/splash_provider.dart';
import 'package:sreeleathers/provider/support_ticket_provider.dart';
import 'package:sreeleathers/provider/theme_provider.dart';
import 'package:sreeleathers/provider/wishlist_provider.dart';
import 'package:sreeleathers/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async 
{
	// Core
	sl.registerLazySingleton(() => NetworkInfo(sl()));
	sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

	// Repository
	sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
	sl.registerLazySingleton(() => FlashDealRepo(dioClient: sl()));
	sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
	sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));
	sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));
	sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
	sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
	sl.registerLazySingleton(() => ProductDetailsRepo(dioClient: sl()));
	sl.registerLazySingleton(() => SearchRepo(dioClient: sl(), sharedPreferences: sl()));
	sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));
	sl.registerLazySingleton(() => SellerRepo(dioClient: sl()));
	sl.registerLazySingleton(() => CouponRepo(dioClient: sl()));
	sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
	sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
	sl.registerLazySingleton(() => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));
	sl.registerLazySingleton(() => WishListRepo(dioClient: sl()));
	sl.registerLazySingleton(() => CartRepo(sharedPreferences: sl()));
	sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
	sl.registerLazySingleton(() => SupportTicketRepo(dioClient: sl()));

	// Provider
	sl.registerFactory(() => CategoryProvider(categoryRepo: sl()));
	sl.registerFactory(() => FlashDealProvider(megaDealRepo: sl()));
	sl.registerFactory(() => BrandProvider(brandRepo: sl()));
	sl.registerFactory(() => ProductProvider(productRepo: sl()));
	sl.registerFactory(() => BannerProvider(bannerRepo: sl()));
	sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
	sl.registerFactory(() => AuthProvider(authRepo: sl()));
	sl.registerFactory(() => ProductDetailsProvider(productDetailsRepo: sl()));
	sl.registerFactory(() => SearchProvider(searchRepo: sl()));
	sl.registerFactory(() => OrderProvider(orderRepo: sl()));
	sl.registerFactory(() => SellerProvider(sellerRepo: sl()));
	sl.registerFactory(() => CouponProvider(couponRepo: sl()));
	sl.registerFactory(() => ChatProvider(chatRepo: sl()));
	sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
	sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
	sl.registerFactory(() => WishListProvider(wishListRepo: sl(), productDetailsRepo: sl()));
	sl.registerFactory(() => SplashProvider(splashRepo: sl()));
	sl.registerFactory(() => CartProvider(cartRepo: sl()));
	sl.registerFactory(() => SupportTicketProvider(supportTicketRepo: sl()));
	sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
	sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));

	// External
	final sharedPreferences = await SharedPreferences.getInstance();
	sl.registerLazySingleton(() => sharedPreferences);
	sl.registerLazySingleton(() => Dio());
	sl.registerLazySingleton(() => LoggingInterceptor());
	sl.registerLazySingleton(() => Connectivity());
}
