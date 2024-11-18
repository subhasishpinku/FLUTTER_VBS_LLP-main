import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';

class WithdrawRequestTable extends StatefulWidget
{
	@override
	_WithdrawRequestTableState createState() => _WithdrawRequestTableState();
}

class _WithdrawRequestTableState extends State<WithdrawRequestTable>
{
	bool isSwitched = false;
	String _chosenValue = "";

	@override
  	Widget build(BuildContext context)
	{
		return  Column
		(
			children:
			// [
				// Row
				// (
				// 	children:
				// 	[
				// 		Text
				// 		(
				// 			"Customer Message Table",
				// 			style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
				// 		),
				// 	],
				// ),
				// SizedBox(height: 20),
				this.table()
			// ],
		);
  	}

	List <Column>table()
	{
		List<Column> data = [];

		for(int i = 0; i < 5; i++)
		{
			data.add
			(
				Column
				(
					children: 
					[
						Card
						(
							elevation: 5,
							child: ExpansionTile
							(
								expandedCrossAxisAlignment: CrossAxisAlignment.start,
								childrenPadding: EdgeInsets.all(10),
								title: Text
								(
									(i + 1).toString() + " " + "Test Data",
									style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),
								),
								children:
								[
									SizedBox(height: 1),
									Text
									(
										"Amount: INR 500",
										style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),
									),
									SizedBox(height: 5),
									Text("Request Time : One hr", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
									SizedBox(height: 5),
									Text("Status: Completed", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
									SizedBox(height: 5),
									Row
									(
										mainAxisAlignment: MainAxisAlignment.end,
										children: 
										[
											// Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
											// SizedBox(width: 10),
											IconButton(onPressed: null, icon: Icon(Icons.edit)),
											IconButton(onPressed: null, icon: Icon(Icons.delete))
										],
									)
								],
							),
						)
					],
				)
			);
		}

		return data;
	}

	Widget tableWidget()
	{
		return Container
		(
			child: ListView.builder
			(
				itemCount: 5,
				itemBuilder: (BuildContext context, int index)
				{
					return Card
					(
						child: ExpansionTile
						(
							expandedCrossAxisAlignment: CrossAxisAlignment.start,
							childrenPadding: EdgeInsets.all(10),
							title: Text
							(
								"Sam John",
								style: TextStyle(color: Color(int.parse("0xff758896"))),
							),
							children:
							[
								Row
								(
									children: 
									[
										Icon(Icons.phone, color: AppColors.iconColor),
										SizedBox(width: 10),
										Text
										(
											"9497045922",
											style: TextStyle(color: Color(int.parse("0xff7F87A7",)), letterSpacing: 0.5),
										),
									],
								),
								SizedBox(height: 1),
								Row
								(
									children: 
									[
										Icon(Icons.email, color: AppColors.iconColor),
										SizedBox(width: 10),
										Text
										(
											"sam@gmail.com",
											style: TextStyle(color: Color(int.parse("0xff7F87A7",)), letterSpacing: 0.5),
										),
									],
								),
								SizedBox(height: 5),
								Text("Subject :", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
								SizedBox(height: 5),
								Text("Lorem Ipsum text:", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]),),
								SizedBox(height: 5),
								Row
								(
									mainAxisAlignment: MainAxisAlignment.end,
									children: 
									[
										// Text("Action:", style: TextStyle(fontWeight: FontWeight.w600),),
										// SizedBox(width: 10),
										IconButton(onPressed: null, icon: Icon(Icons.edit)),
										IconButton(onPressed: null, icon: Icon(Icons.delete))
									],
								)
							],
						),
					);
				}
			)
		);
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
}