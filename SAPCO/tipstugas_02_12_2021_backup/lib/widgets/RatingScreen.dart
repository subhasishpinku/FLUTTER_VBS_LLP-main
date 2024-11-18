import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';
late InAppReview inAppReview = InAppReview.instance;
ratingVideosSheet(context)
{
	double stars = 0;
	showDialog
	(
		context: context,
		builder: (BuildContext context)
		{
			return AlertDialog
			(
				backgroundColor: Colors.white,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
				title: Center
				(
					child: new Text
					(
						"TIPSTUGAS",
						style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
					)
				),
				content: Column
				(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisSize: MainAxisSize.min,
					children: 
					[
						new Text
						(
							"Classifica a tua experiencia connosco?",
							style: TextStyle
							(
							// color: Colors.black.withOpacity(0.7),
							fontWeight: FontWeight.w600,
							fontSize: 16.0
							),
						),
						RatingBar.builder
						(
							initialRating: 1,
							minRating: 1,
							direction: Axis.horizontal,
							allowHalfRating: false,
							itemCount: 5,
							itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
							itemBuilder: (context, _) => Icon
							(
								Icons.star,
								color: Colors.amber,
							),
							onRatingUpdate: (rating) 
							{
								stars = rating;
							},
						)
					],
				),
				actions: <Widget>
				[
					new TextButton
					(
						child: Text('OK'),
						onPressed: () async
						{
							if(stars < 4)
							{
								// Navigator.pop(context);
								Fluttertoast.showToast(msg: "Obrigado pela sua review", fontSize: 20, backgroundColor: Colors.black87, textColor: Colors.white);
							}
							else
							{
								_launchURL();
							}
							Navigator.pop(context);
						},
					)
				],
			);
		},
	);
}
showPopUp(context)
{
	AlertDialog alert = AlertDialog
	(
		// backgroundColor: Colors.black38,
		content: StatefulBuilder
		(
			builder: (BuildContext context, StateSetter setState)
			{
				return  Column
				(
					mainAxisAlignment: MainAxisAlignment.center,
					mainAxisSize: MainAxisSize.min,
					children: <Widget>
					[
						Align
						(
							alignment: Alignment.topRight,
							child: IconButton
							(
								onPressed: () => Navigator.pop(context),
								icon: Icon(Icons.close)
							),
						),
						Text
						(
							"Obrigado pela sua review",
							style: GoogleFonts.ibmPlexSans
							(
								fontWeight: FontWeight.w500
							),
						)
					]
				);
			}
		)
	);
	return showDialog
	(
		context: context,
		barrierDismissible: false,
		builder: (BuildContext context)
		{
			return alert;
		}
	);
}
_launchURL() async
{
	const url = 'https://play.google.com/store/apps/details?id=com.tips.tugas.pt';
	if (await canLaunch(url))
	{
		await launch(url);
	}
	else
	{
		throw 'Could not launch $url';
	}
}