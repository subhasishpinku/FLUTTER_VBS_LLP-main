// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipstugas/widgets/Home.dart';
import 'package:tipstugas/widgets/google_sign.dart';
import 'package:tipstugas/widgets/utilities/TextStyle.dart';

class SplashScreen extends StatefulWidget 
{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
	// late FirebaseMessaging _firebaseMessaging;
	String messageTitle = "Empty";
	String notificationAlert = "alert";
	String messageDescription = "";
	
	FirebaseService service = FirebaseService();

		Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
		// If you're going to use other Firebase services in the background, such as Firestore,
		// make sure you call `initializeApp` before using other Firebase services.
		await Firebase.initializeApp();

		print("Handling a background message: ${message.messageId}");
	}


	@override 
	void initState()
	{
		super.initState();
		FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
	}

	Widget build(BuildContext context)
	{
		Future.delayed(Duration(seconds: 3), () 
		{
  			Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
		});

		return Scaffold
		(
			body: Container
			(
				height: double.infinity,
				width: double.infinity,
				child: Image.asset("assets/images/logo_new.jpg", fit: BoxFit.fill)
			)
		);
	}

	firebaseInitialize() async
	{
		FirebaseMessaging messaging = FirebaseMessaging.instance;
		print("Firebase initialized");

		NotificationSettings settings = await messaging.requestPermission
		(
			alert: true,
			announcement: false,
			badge: true,
			carPlay: false,
			criticalAlert: false,
			provisional: false,
			sound: true,
		);


		FirebaseMessaging.onMessage.listen((RemoteMessage message) 
		{
      		RemoteNotification? notification = message.notification;
		});
	}
}