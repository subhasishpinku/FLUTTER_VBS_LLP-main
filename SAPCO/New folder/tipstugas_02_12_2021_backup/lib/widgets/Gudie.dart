import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tipstugas/widgets/utilities/BottomNavigationbar.dart';
import 'package:tipstugas/widgets/utilities/CustomAppbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget
{
	final url;
	final title;
	WebViewScreen(this.url, this.title);

	@override
	_WebViewScreenState createState() => _WebViewScreenState(this.url, this.title);
}

class _WebViewScreenState extends State<WebViewScreen>
{
	final url;
	final title;
	_WebViewScreenState(this.url, this.title);

	final Completer<WebViewController> _controller = Completer<WebViewController>();
	late WebViewController controllerGlobal;
	bool _isLoading = true;

	bool isOdds = false;

  	@override
  	Widget build(BuildContext context)
	{
    	return Scaffold
		(
			appBar: appBar(this.title, context, false),
        	body: Column
			(
          		children:
				[
            		Expanded
					(
              			child: Stack
						(
							children:
							[
                  				WebView
								(
									javascriptMode: this.title.toString() == "Telegram" ? JavascriptMode.disabled : JavascriptMode.unrestricted,
									initialUrl: this.url.toString(),
									gestureNavigationEnabled: true,
									onWebViewCreated: (WebViewController webViewController)
									{
										_controller.future.then((value) => controllerGlobal = value);
										_controller.complete(webViewController);
                    				},
									onPageStarted: (String url)
									{
										print('Page started loading: $url');
										setState(() {
											_isLoading = true;
										});
                    				},
                    				onPageFinished: (String url)
									{
                      					print('Page finished loading: $url');
                      					setState(()
										{
											_isLoading = false;
                      					});
                    				},
                  				),
                			],
              			),
            		),
          		],
        	),
			// bottomNavigationBar: bottomNavigationBar(context),
    	);
  	}

  	Future<bool> _exitApp() async
	{
    	if(controllerGlobal != null)
		{
      		if (await controllerGlobal.canGoBack())
			{
				controllerGlobal.goBack();
				return Future.value(false);
      		}
			else
			{
        		return Future.value(true);
     	 	}
		}
		else
		{
      		return Future.value(true);
    	}
  	}
}
