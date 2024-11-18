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
class PremiumTips extends StatefulWidget
{
	@override
	_PremiumTipsState createState() => _PremiumTipsState();
}
class _PremiumTipsState extends State<PremiumTips>
{
	StreamController _stream = new StreamController();
	bool isLoading = true;

	@override
	void initState()
	{
		super.initState();
		getPremiumTips();
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
			appBar: appBar("Premium Tips", context, false),
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
							return SingleChildScrollView
							(
								child: Column
								(
									crossAxisAlignment: CrossAxisAlignment.start,
									children:
									[
										telegramData != null ? Padding
										(
											padding: EdgeInsets.all(10),
											child: OutlinedButton
											(
												onPressed: ()
												{
													Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(telegramData["telegramBought"], "Telegram")));
												},
												style: ButtonStyle
												(
													backgroundColor: MaterialStateProperty.all(Colors.blue[400])
												),
												child: Text
												(
													'Telegram Channel',
													style: TextStyle(fontSize: 15, color: Colors.white),
												),
											)
										) : SizedBox.shrink(),
										Column
										(
											children: this.rows(snapshot)
										)
									]
								)
							);

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

	List<Column> rows(snapshot)
	{
		List <Column> rows = [];

		for(int index = 0; index < snapshot.data.length; index++)
		{
			rows.add
			(
				Column
				(
					children:
					[
						Card
						(
							elevation: 5,
							child: ListTile
							(
								leading: Column
								(
									children:
									[
										Expanded(child: Image.network(snapshot.data[index]["imgURL"])),
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
												if (await canLaunch(link.url)) {
												await launch(link.url);
											} else {
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
										Row
										(
											crossAxisAlignment: CrossAxisAlignment.start,
											children:
											[
												snapshot.data[index]["paid"] == "" ? SizedBox.shrink() : Container
												(
													margin: EdgeInsets.all(5),
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
													margin: EdgeInsets.all(5),
													padding: EdgeInsets.all(5),
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
														),
													),
												)
											],
										),
									],
								)
							)
						)
					],
				)
			);
		}

		return rows;
	}

	getPremiumTips() async
	{
		// premiumList.clear();

		var response = await Server.premiumTips();

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