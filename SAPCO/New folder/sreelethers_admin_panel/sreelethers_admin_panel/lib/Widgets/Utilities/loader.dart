import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';

void loader(BuildContext context)
{
	AlertDialog alert = AlertDialog
	(
		// backgroundColor: Colors.black38,
		content: Column
		(
        	mainAxisAlignment: MainAxisAlignment.center,
        	mainAxisSize: MainAxisSize.min,
        	children: <Widget>
			[
          		SizedBox
				(
					width: 60,
					height: 60,
					child: CircularProgressIndicator
					(
						backgroundColor: Colors.black12,
						valueColor: AlwaysStoppedAnimation(AppColors.appBarColor),
					)
          		)
        	]
      	)
	);

	showDialog
	(
		context: context,
		barrierDismissible: false,
		builder: (BuildContext context)
		{
			return alert;
		}
	);
}
