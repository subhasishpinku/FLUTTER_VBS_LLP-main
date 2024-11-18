import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EarningReport extends StatefulWidget
{
	const EarningReport({ Key? key }) : super(key: key);

	@override
	_EarningReportState createState() => _EarningReportState();
}

class _EarningReportState extends State<EarningReport>
{
	@override
	Widget build(BuildContext context) 
	{
  		return SafeArea
		(
			top: false,
			child: DefaultTabController
			(
				length: 2,
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
								Tab(child: Text("Report")),
								Tab(child: Text("Graph"))
							],
						),
						title: Text('Earning Report Overview'),
					),
					body: TabBarView
					(
						children:
						[
							displayData(),
							displayChart()
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
					totalSold(),
					// SizedBox(height: 4),
					totalTax(),
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

	Widget totalSold()
	{
		return Container
		(
			padding: EdgeInsets.only(top: 25),
			child: Card
			(
				elevation: 12,
				child: ListTile
				(
					title: Text("Total Sold", style: Theme.of(context).textTheme.headline6),
					subtitle: Row
					(
						children: 
						[
							Icon(Icons.auto_graph_rounded),
							SizedBox(width: 5),
							Text("₹"),
							Text("10K", style: Theme.of(context).textTheme.bodyText1,)
						]
					),
					trailing: Text("54%", style: TextStyle(color: Colors.green))
				)
			)
		);
	}


	Widget totalTax()
	{
		return Container
		(
			padding: EdgeInsets.only(top: 25),
			child: Card
			(
				elevation: 12,
				child: ListTile
				(
					title: Text("Total tax", style: Theme.of(context).textTheme.headline6),
					subtitle: Row
					(
						children: 
						[
							Icon(Icons.auto_graph_rounded),
							SizedBox(width: 5),
							Text("₹"),
							Text("10K", style: Theme.of(context).textTheme.bodyText1,)
						]
					),
					trailing: Text("64%", style: TextStyle(color: Colors.green))
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
}

class SalesData
{
	SalesData(this.year, this.sales);
	final String year;
	final double sales;
}


class _PieData 
{
	_PieData(this.xData, this.yData, this.text);
	final String xData;
	final num yData;
	final String text;
}