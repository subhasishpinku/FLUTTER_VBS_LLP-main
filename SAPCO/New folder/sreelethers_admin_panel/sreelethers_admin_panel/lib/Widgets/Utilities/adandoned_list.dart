import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';

class AbandonedList extends StatefulWidget
{
	const AbandonedList({ Key? key }) : super(key: key);

	@override
	_AbandonedListState createState() => _AbandonedListState();
}

class _AbandonedListState extends State<AbandonedList>
{
	@override
	Widget build(BuildContext context)
	{
		return Scaffold
		(
			appBar: AppBar
			(
				backgroundColor: AppColors.appBarColor,
				title: Text("Abandon Section"),
			),
			body: ListView
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
								"Abandon Table",
								style: TextStyle(color: AppColors.title, fontWeight: FontWeight.bold, fontSize: fontSize(context, 18)),
							),
						],
					),
					SizedBox(height: 20),
					Column
					(
						children: this.table(),
					)
				]
			)
		);
	}

	List <Column>table()
	{
		List<Column> data = [];

		for(int index = 0; index < 100; index++)
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
								childrenPadding: EdgeInsets.all(10),
								title: Text
								(
									(index + 1).toString() + "." + " Username",
									style: TextStyle(color: AppColors.title, fontSize: fontSize(context, 23)),
								),
								children:
								[
									Text("Email: useremail@gmail.com", style: TextStyle(fontSize: fontSize(context, 26),fontWeight: FontWeight.w400, color: AppColors.title)),
									SizedBox(height: 15),
									Text("Product Name: Formal Shoes", style: TextStyle(fontSize: fontSize(context, 26),fontWeight: FontWeight.w400, color: AppColors.title)),
									SizedBox(height: 15),
									Text("Quantity: 10", style: TextStyle(fontSize: fontSize(context, 26),fontWeight: FontWeight.w400, color: AppColors.title)),
									Row
									(
										mainAxisAlignment: MainAxisAlignment.end,
										children:
										[
											ElevatedButton
											(
												style: ElevatedButton.styleFrom
												(
													primary: AppColors.appBarColor,
													elevation: 1
												),
												child: Text("Email", style: TextStyle(fontSize: fontSize(context, 23))),
												onPressed: ()
												{
													setState(()
													{
													});
												}
											),
										],
									)
								],
							),
						)
					]
				)
			);
		}

		return data;
	}
}