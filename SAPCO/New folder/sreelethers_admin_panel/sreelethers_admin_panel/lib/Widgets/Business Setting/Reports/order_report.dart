import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrderReport extends StatefulWidget
{
	const OrderReport({ Key? key }) : super(key: key);

	@override
	_OrderReportState createState() => _OrderReportState();
}

class _OrderReportState extends State<OrderReport>
{
	bool thisWeek = true;
	bool lastWeek = false;

	@override
	Widget build(BuildContext context) 
	{
  		return SafeArea
		(
			top: false,
			child: DefaultTabController
			(
				length: 3,
				child: Scaffold
				(
					resizeToAvoidBottomInset: true,
					appBar: AppBar
					(
						backgroundColor: Color(int.parse("0xff397BFA")),
						bottom: TabBar
						(
							indicatorColor: Colors.white,
							tabs:
							[
								Tab(child: Text("Report", style: Theme.of(context).textTheme.headline5)),
								Tab(child: Text("Total Order", style: Theme.of(context).textTheme.headline5)),
								Tab(child: Text("Weekly Report", style: Theme.of(context).textTheme.headline5))
							],
						),
						title: Text('Order Report Overview'),
					),
					body: TabBarView
					(
						children:
						[
							displayData(),
							displayChart(),
							displayWeeeklyReport(),
						]
					)
				)
			)
    	);
	}

	Widget displayData()
	{
		return Container
		(
			child: ListView
			(
				padding: EdgeInsets.all(20),
				children:
				[
					startDate(),
					SizedBox(height: 20),
					endDate(),
					SizedBox(height: 20),
					showButton(context),
					card("Delivered", Icons.shopping_cart_outlined, 20, 200),
					card("Returned", Icons.remove_shopping_cart_outlined, 69, 1000),
					card("Failed", Icons.sms_failed, 80, 800),
					card("Processing", Icons.run_circle_outlined, 40, 670)
				],
			),
		);
	}

	Widget startDate()
	{
		return TextFormField
		(
			// controller: dobField,
			keyboardType: TextInputType.datetime,
			// style:  GoogleFonts.montserrat
			// (
			// 	fontWeight: FontWeight.bold,
			// 	color: Colors.black,
			// 	fontSize: 12
			// ),
			decoration: InputDecoration
			(
				labelText: "Start Date",
				labelStyle: TextStyle(fontSize: 14.0),
				hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
				enabledBorder: OutlineInputBorder
				(
					borderRadius: BorderRadius.circular(5.0),
					borderSide: BorderSide
					(
						color: Colors.black12,
						width: 0.5,
					),
				),
				suffixIcon: Icon(Icons.calendar_today, size: 20, color: Colors.black38,),
				suffixIconConstraints: BoxConstraints
				(
					minWidth: 45,
					minHeight: 5,
				),
				focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(10)),
				border: InputBorder.none
			),
			onTap: () async
			{
				FocusScope.of(context).requestFocus(new FocusNode());
					var date = await showDatePicker
					(
						context: context,
						initialDate: DateTime(2000),
						firstDate:DateTime(1970),
						lastDate: DateTime(2010)
					);
					var x = date.toString().split("-").join("/");
					var temp = x.split(" ");

					setState(()
					{
						// dobField.text = temp[0].toString();
					});
			},
			validator: (value)
			{
				if(value == null || value.isEmpty)
				{
					return "*Date of birth cannot be empty";
				}
			},
			// onSaved: (value) => dobField.text = value.toString(),
		);
	}

	Widget endDate()
	{
		return TextFormField
		(
			// controller: dobField,
			keyboardType: TextInputType.datetime,
			// style:  GoogleFonts.montserrat
			// (
			// 	fontWeight: FontWeight.bold,
			// 	color: Colors.black,
			// 	fontSize: 12
			// ),
			decoration: InputDecoration
			(
				labelText: "End Date",
				labelStyle: TextStyle(fontSize: 14.0),
				hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),
				enabledBorder: OutlineInputBorder
				(
					borderRadius: BorderRadius.circular(5.0),
					borderSide: BorderSide
					(
						color: Colors.black12,
						width: 0.5,
					),
				),
				suffixIcon: Icon(Icons.calendar_today, size: 20, color: Colors.black38,),
				suffixIconConstraints: BoxConstraints
				(
					minWidth: 45,
					minHeight: 5,
				),
				focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(10)),
				border: InputBorder.none
			),
			onTap: () async
			{
				FocusScope.of(context).requestFocus(new FocusNode());
					var date = await showDatePicker
					(
						context: context,
						initialDate: DateTime(2000),
						firstDate:DateTime(1970),
						lastDate: DateTime(2010)
					);
					var x = date.toString().split("-").join("/");
					var temp = x.split(" ");

					setState(()
					{
						// dobField.text = temp[0].toString();
					});
			},
			validator: (value)
			{
				if(value == null || value.isEmpty)
				{
					return "*Date of birth cannot be empty";
				}
			},
			// onSaved: (value) => dobField.text = value.toString(),
		);
	}

	Widget displayChart()
	{
		return Center
		(
			child: Container
			(
				child: Column
				(
					children: 
					[
						SizedBox(height: 20),
						Text("Total Sale of 2021"),
						Expanded
						(
							child: SfCartesianChart
							(
								// Initialize category axis
								primaryXAxis: CategoryAxis(),
								series: <LineSeries<SalesData, String>>
								[
									LineSeries<SalesData, String>
									(
										// Bind data source
										dataSource:  <SalesData>
										[
											SalesData('Jan', 35),
											SalesData('Feb', 28),
											SalesData('Mar', 34),
											SalesData('Apr', 32),
											SalesData('May', 40),
											SalesData('June', 10),
											SalesData('July', 60),
											SalesData('Aug', 85),
											SalesData('Sep', 70),
											SalesData('Oct', 60),
											SalesData('Nov', 20),
											SalesData('Dec', 89),
										],
										xValueMapper: (SalesData sales, _) => sales.year,
										yValueMapper: (SalesData sales, _) => sales.sales
									)
								]
							)
						)
					],
				)
			)
		);
	}

	Widget card(title, icon, percent, price)
	{
		return Container
		(
			padding: EdgeInsets.only(top: 25),
			child: Card
			(
				elevation: 12,
				child: ListTile
				(
					title: Row
					(
						children: 
						[
							Icon(icon),
							SizedBox(width: 5),
							Text(title, style: Theme.of(context).textTheme.bodyText1)
						],
					),
					subtitle: Padding
					(
						padding: EdgeInsets.all(5),
						child: Text("₹" + price.toString(), style: Theme.of(context).textTheme.bodyText1),
					),
					trailing: Text(percent.toString() + "%", style: TextStyle(color: Colors.green))
				)
			)
		);
	}

	Widget showButton(context)
	{
		return Container
		(
			margin: EdgeInsets.only(bottom: 20),
			height: MediaQuery.of(context).size.height / 15,
			// width: 70,
			padding: EdgeInsets.only(left: 50, right: 50),
			child: ElevatedButton
			(
				child: Text
				(
					"Show",
					style: TextStyle(fontSize: 15)
				),
				style: ButtonStyle
				(
					foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
					backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse("0xff397BFA"))),
					shape: MaterialStateProperty.all<RoundedRectangleBorder>
					(
						RoundedRectangleBorder
						(
							borderRadius: BorderRadius.circular(10),
							side: BorderSide(color: Colors.white38)
						)
					)
				),
				onPressed: () async
				{
					Navigator.pushNamed(context, "dashboard");
				}
			)
		);
	}

	displayWeeeklyReport()
	{
		return Center
		(
			child: Container
			(
				child: Column
				(
					children: 
					[
						SizedBox(height: 20),
						Row
						(
							mainAxisAlignment: MainAxisAlignment.end,
							children: 
							[
								ElevatedButton
								(
									style: ElevatedButton.styleFrom
									(
										primary: thisWeek ? Colors.blue : Colors.white,
										elevation: thisWeek ? 5 : 0
									),
									child: Text("This Week", style: thisWeek ?   Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.bodyText2),
									onPressed: ()
									{
										setState(() 
										{
											thisWeek = !thisWeek;
											lastWeek = !lastWeek;
										});
									}
								),
								SizedBox(width: 2),
								ElevatedButton
								(
									style: ElevatedButton.styleFrom
									(
										primary: lastWeek ? Colors.blue : Colors.white,
										elevation: lastWeek ? 5 : 0
									),
									child: Text("Last Week", style: lastWeek ?   Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.bodyText2),
									onPressed: ()
									{
										setState(() 
										{
											thisWeek = !thisWeek;
											lastWeek = !lastWeek;
										});
									}
								),
								SizedBox(width: 10),
							]
						),
						Expanded
						(
							child: SfCartesianChart
							(
								// Initialize category axis
								primaryXAxis: CategoryAxis(),
								series: <LineSeries<SalesData, String>>
								[
									LineSeries<SalesData, String>
									(
										// Bind data source
										dataSource:  <SalesData>
										[
											SalesData('Jan', thisWeek ? 35 : 20),
											SalesData('Feb', thisWeek ? 28 : 50),
											SalesData('Mar', thisWeek ? 34 : 10),
											SalesData('Apr', thisWeek ? 32 : 78),
											SalesData('May', thisWeek ? 40 : 47),
											SalesData('June', thisWeek ? 10 : 54),
											SalesData('July', thisWeek ? 60 : 86),
											SalesData('Aug', thisWeek ? 85 : 63),
											SalesData('Sep', thisWeek ? 70 : 35),
											SalesData('Oct', thisWeek ? 60 : 18),
											SalesData('Nov', thisWeek ? 20 : 86),
											SalesData('Dec', thisWeek ? 89 : 54),
										],
										xValueMapper: (SalesData sales, _) => sales.year,
										yValueMapper: (SalesData sales, _) => sales.sales
									)
								]
							)
						)
					],
				)
			)
		);
	}
}

class SalesData
{
	SalesData(this.year, this.sales);
	final String year;
	final double sales;
}
