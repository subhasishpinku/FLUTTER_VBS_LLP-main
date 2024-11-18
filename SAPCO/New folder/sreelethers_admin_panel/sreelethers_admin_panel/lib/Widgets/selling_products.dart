import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:sreelethers_admin/Widgets/Utilities/dimensions.dart';

class SellingProduts extends StatefulWidget
{
	const SellingProduts({ Key? key }) : super(key: key);

	@override
	_SellingProdutsState createState() => _SellingProdutsState();
}

class _SellingProdutsState extends State<SellingProduts>
{
	@override
  	Widget build(BuildContext context)
	{
		return Container
		(
			margin: EdgeInsets.only(top: 15),
			child: Row
			(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children:
				[
					card("Best Selling", "High Heels"),
					card("New Selling", "Shoes"),
				]
			)
		);
  	}

	Widget card(category, title)
	{
		return Card
		(
			elevation: 10,
			child: Column
			(
				children: 
				[
					Padding
					(
						padding: EdgeInsets.all(10),
						child: Text(category.toString(), style: TextStyle(fontSize: fontSize(context, 23), color: AppColors.title)),
					),
					Container
					(
						height: MediaQuery.of(context).size.height * 0.25,
						child: Image.network("https://images.pexels.com/photos/3389419/pexels-photo-3389419.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", fit: BoxFit.contain),
					),
					Padding
					(
						padding: EdgeInsets.all(10),
						child: Text(title.toString(), style: TextStyle(fontSize: fontSize(context, 25), color: AppColors.title)),
					),
				]
			)
		);
	}
}