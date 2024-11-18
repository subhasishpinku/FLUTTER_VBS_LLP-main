import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipstugas/Server.dart';
import 'package:tipstugas/global.dart';
import 'package:tipstugas/widgets/Gudie.dart';
import 'package:tipstugas/widgets/utilities/CustomAppbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class FreeTips extends StatefulWidget
{
	@override
	_FreeTipsState createState() => _FreeTipsState();
}

class _FreeTipsState extends State<FreeTips>
{
	StreamController _stream = new StreamController();
	bool isLoading = true;

	@override
	void initState()
	{
		super.initState();
		getFreeTips();
	}

	@override
  	void dispose()
	{
		super.dispose();
		_stream.close();
  	}

	@override
	Widget build(BuildContext context)
	{
		return Scaffold
		(
			backgroundColor: Colors.white,
			appBar: appBar("Free Tips", context, false),
			body: Container
			(
				child: StreamBuilder
				(
					stream: _stream.stream,
        			builder: (BuildContext context, AsyncSnapshot snapshot) 
					{
						if (snapshot.hasError)
						{
							return Text(snapshot.error.toString());
						}

          				if (snapshot.hasData) 
						{
							return body(snapshot);
						}

						if (snapshot.connectionState != ConnectionState.done) 
						{
							return Center
							(
								child: CircularProgressIndicator(),
							);
						}

						if (!snapshot.hasData && snapshot.connectionState == ConnectionState.done) 
						{
							return Text('No Posts');
						}

						return Text("HIII");
					},
      			),
    		)
		);
  	}

	Widget body(snapshot)
	{
		return Container
		(
			padding: EdgeInsets.all(2),
			margin: EdgeInsets.only(top: 20, bottom: 10),
			child: ListView.builder
			(
				itemCount: snapshot.data.length,
				itemBuilder: (BuildContext context, int index)
				{
					return Card
					(
						child: ListTile
						(
							leading: Column
							(
								children:
								[
									Expanded(child: Image.network(snapshot.data[index]["imgURL"]),),
									Text
									(
										snapshot.data[index]["odd"],
										style: GoogleFonts.ibmPlexSans
										(
											fontSize: 14,
										)
									)
								]
							),
							title: Text
							(
								snapshot.data[index]["league"],
								style: GoogleFonts.ibmPlexSans
								(
									fontSize: 14,
								),
							),
							subtitle: Column
							(
								crossAxisAlignment: CrossAxisAlignment.start,
								children:
								[
									Linkify
									(
										onOpen: (link) async
										{
											if (await canLaunch(link.url))
											{
												await launch(link.url);
											} 
											else 
											{
												throw 'Could not launch $link';
											}
										},
										text: snapshot.data[index]["matchh"].toString(),
										style: GoogleFonts.ibmPlexSans
										(
											color: Colors.grey,
											fontWeight: FontWeight.w500,
											fontSize: 14,
										)
										// linkStyle: TextStyle(color: Colors.red),
									),
									Text
									(
										snapshot.data[index]["tip"],
										style: GoogleFonts.ibmPlexSans
										(
											fontSize: 12,
										),
									),
									Text
									(
										snapshot.data[index]["date"],
										style: GoogleFonts.ibmPlexSans
										(
											fontWeight: FontWeight.w500,
											fontSize: 14,
										),
									),
									SizedBox(height: 5),
									Row
									(
										crossAxisAlignment: CrossAxisAlignment.start,
										children:
										[
											snapshot.data[index]["paid"] == "" ? SizedBox.shrink() : Container
											(
												margin: EdgeInsets.all(2),
												padding: EdgeInsets.all(5),
												decoration: BoxDecoration
												(
													borderRadius: BorderRadius.circular(15),
													color: Colors.blue
												),
												child: Text
												(
													snapshot.data[index]["paid"],
													style: GoogleFonts.ibmPlexSans
													(
														fontWeight: FontWeight.w500,
														color: Colors.white,
														fontSize: 12,
													),
												),
											),
											SizedBox(width: 5),
											snapshot.data[index]["status"] == "" ? SizedBox.shrink() : Container
											(
												padding: EdgeInsets.all(5),
												margin: EdgeInsets.all(5),
												decoration: BoxDecoration
												(
													borderRadius: BorderRadius.circular(15),
													color: snapshot.data[index]["status"] == "Ganha" ? Colors.green : Colors.red
												),
												child: Text
												(
													snapshot.data[index]["status"],
													style: GoogleFonts.ibmPlexSans
													(
														fontWeight: FontWeight.w500,
														color: Colors.white,
														fontSize: 12,
													)
												)
											)
										]
									)
								]
							)
						)
					);
				}
			)
		);
	}

	getFreeTips() async
	{
		// premiumList.clear();

		var response = await Server.freeTips();

		if(response["status"] == "true")
		{
			_stream.add(response["data"]);

			for(int i = 0; i < response["data"].length; i++)
			{
				// premiumList.add(response["data"][i]);

				setState(()
				{
					isLoading = false;
				});
			}
		}
		else
		{
			// premiumList.length = 0;
		}
	}
}