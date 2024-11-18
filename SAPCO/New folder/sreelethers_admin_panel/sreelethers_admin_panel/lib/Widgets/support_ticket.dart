
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/API/server.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';

class SupportTicket extends StatefulWidget
{
	const SupportTicket({ Key? key }) : super(key: key);

	@override
	_SupportTicketState createState() => _SupportTicketState();
}

class _SupportTicketState extends State<SupportTicket>
{
	bool isSwitched = false;
	String _chosenValue = "";

	StreamController _streamController = new StreamController();

	@override
	void initState()
	{
		super.initState();
		getSupportTickets();
	}

	@override
  	Widget build(BuildContext context)
	{
		return Scaffold
		(
			appBar: AppBar
			(
				backgroundColor: AppColors.appBarColor,
				title: Text("Support Ticket"),
			),
			body:ListView
			(
				padding: EdgeInsets.all(15),
				children:
				[
					Row
					(
						children:
						[
							Text
							(
								"Ticket List",
								style: TextStyle(color: AppColors.title, fontWeight: FontWeight.bold, fontSize: fontSize(context, 20)),
							),
						],
					),
					SizedBox(height: 20),
					StreamBuilder
					(
						stream: _streamController.stream,
						builder: (BuildContext context, AsyncSnapshot snapshot) 
						{
							if (snapshot.hasError)
							{
								print("1");
								return Text(snapshot.error.toString());
							}

							if (snapshot.hasData) 
							{
								print("2");
								return Column
								(
									children: this.table(snapshot.data)
								);
							}
							if (snapshot.connectionState != ConnectionState.done) 
							{
								print("3");
								return Center
								(
									child: CircularProgressIndicator(),
								);
							}

							if (!snapshot.hasData && snapshot.connectionState == ConnectionState.done)
							{
								print("4");
								return Text('No Posts');
							}

							return Text("HIII");
						}
					)
				]
			)
		);
  	}

	List <Column>table(list)
	{
		List<Column> data = [];

		for(int index = 0; index < 1; index++)
		{
			data.add
			(
				Column
				(
					children:
					[
						Card
						(
							child: ExpansionTile
							(
								expandedCrossAxisAlignment: CrossAxisAlignment.start,
								childrenPadding: EdgeInsets.only(left: 10),
								title: Text
								(
									(index + 1).toString() + "." + list[index]["subject"],
									style: TextStyle(color: AppColors.title, fontSize: fontSize(context, 25)),
								),
								tilePadding: EdgeInsets.all(5),
								children:
								[
									Text
									(
										"Priority: " + list[index]["priority"],
										style: TextStyle(color: AppColors.title, fontSize: fontSize(context, 25),
										letterSpacing: 0.5),
									),
									SizedBox(height: 5),
									Row
									(
										children:
										[
											Text("STATUS:", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
											Switch
											(
												onChanged: toggleSwitch,
												value: list[index]["status"] == 0 ? false : true,
												activeColor: Colors.blue,
											),
										],
									),
									Row
									(
										mainAxisAlignment: MainAxisAlignment.end,
										children:
										[
											// Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
											// SizedBox(width: 10),
											IconButton(onPressed: () => Navigator.pushNamed(context, "ticket-chat", arguments: list[index]["ticketId"]), icon: Icon(Icons.remove_red_eye)),
										],
									)
								]
							)
						)
					]
				)
			);
		}
		return data;
	}

	void toggleSwitch(bool value)
	{
    	if(isSwitched == false)
    	{
      		setState(()
			{
        		isSwitched = true;
      		});
      		print('Switch Button is ON');
   	 	}
    	else
    	{
      		setState(()
			{
        		isSwitched = false;
      		});
      		print('Switch Button is OFF');
    	}
  	}

	getSupportTickets() async
	{
		var response = await Server.supportTicketList();

		if(response != false)
		{
			_streamController.add(response["ticketList"]);

				setState(()
				{
					// isLoading = false;
				});
		}
		else
		{
			// premiumList.length = 0;
		}
	}
}