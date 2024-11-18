import 'package:flutter/cupertino.dart';

fontSize(context, size)
{
	double screenWidth = 0;

	MediaQueryData _mediaQueryData = MediaQuery.of(context);
	screenWidth = _mediaQueryData.size.width;

	return screenWidth / size;
}