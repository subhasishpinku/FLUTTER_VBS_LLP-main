import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sreelethers_admin/Widgets/API/server.dart';
import 'package:sreelethers_admin/Widgets/Utilities/colors.dart';
import 'package:http/http.dart' as http;

class TicketChat extends StatefulWidget {
  const TicketChat({Key? key}) : super(key: key);

  @override
  _TicketChatState createState() => _TicketChatState();
}

class _TicketChatState extends State<TicketChat> {
  StreamController _streamController = new StreamController();

  bool isMe = true;
  bool addDate = false;

  String routeArgs = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    print(routeArgs.toString());

    print("routeArgs");
    getSupportTickets();
    fetchSupTickMessage(1);
  }

  var username;
  var userImage;
  var ticketDescription;
  var fetchData;

  Future<void> fetchSupTickMessage(id) async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse(
        'https://development.lifeproductions.in/sreelathers/api/admin/ticket/ticketDetails/$id');
    var response = await http.get(url);
    setState(() {
      fetchData = jsonDecode(response.body)['ticketDetails'];
      username = fetchData[0]['username'];
      userImage = fetchData[0]['userImage'];
      ticketDescription = fetchData[0]['ticketDescription'];
    });

    print(fetchData);
    print(userImage);
    print('-----------------------------------');
    print(fetchData[0]['conversation'][0]['adminMessage']);
    // print(fetchData[0]['contersation'][0]['adminMessage']);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final conversation = fetchData[0]['conversation'];

    return Scaffold(
        appBar: AppBar(),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child:
                    //  StreamBuilder(
                    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //   print("snapshot.data");
                    //   print(snapshot.data);
                    // return
                    Column(children: [
                Expanded(
                    child: Scrollbar(
                        child: SingleChildScrollView(
                            reverse: true,
                            physics: BouncingScrollPhysics(),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  chatBox(
                                      fetchData[0]['ticketDescription'], false),
                                  SizedBox(
                                      width: 1170,
                                      child: ListView.builder(
                                          padding: EdgeInsets.all(10),
                                          itemCount: fetchData[0]
                                                  ['conversation']
                                              .length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  fetchData[0]['conversation']
                                                                  [index][
                                                              'adminMessage'] !=
                                                          null
                                                      ? CrossAxisAlignment.end
                                                      : CrossAxisAlignment
                                                          .start,
                                              children: [
                                                chatBox(
                                                    conversation[index][
                                                                'adminMessage'] !=
                                                            null
                                                        ? conversation[index]
                                                            ['adminMessage']
                                                        : conversation[index][
                                                                    'customerMessage'] ==
                                                                null
                                                            ? ''
                                                            : conversation[
                                                                    index][
                                                                'customerMessage'],
                                                    conversation[index]
                                                            ['adminMessage'] !=
                                                        null)
                                              ],
                                            );

                                            // ------------------------------------------

                                            // Text(
                                            //   'data',
                                            //   style: TextStyle(
                                            // color: fetchData[0]['conversation']
                                            //             [index]['adminMessage'] !=
                                            //         null
                                            //           ? Colors.red
                                            //           : Colors.yellow),
                                            // );

                                            // --------------------------------------
                                            //   Padding(
                                            //       // ignore: dead_code
                                            //       padding: index.isEven
                                            //           ? EdgeInsets.fromLTRB(50, 5, 10, 5)
                                            //           : EdgeInsets.fromLTRB(10, 5, 50, 5),
                                            //       child: Column(
                                            //           crossAxisAlignment: index.isEven
                                            //               ? CrossAxisAlignment.end
                                            //               : CrossAxisAlignment.start,
                                            //           children: [
                                            //             // addDate
                                            //             // 	? Padding
                                            //             // 	(
                                            //             // 		padding: EdgeInsets.all(10),
                                            //             // 		child: Align(alignment: Alignment.center, child: Text("_date", textAlign: TextAlign.center)),
                                            //             // 	) : SizedBox(),
                                            //             // index.isEven
                                            //             // ? Row
                                            //             // (
                                            //             // 	mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                                            //             // 	children:
                                            //             // 	[
                                            //             // 		Text
                                            //             // 		(
                                            //             // 			"name",
                                            //             // 		),
                                            //             // 		Container
                                            //             // 		(
                                            //             // 			width: 25,
                                            //             // 			height: 25,
                                            //             // 			margin: EdgeInsets.only(left: 8, bottom: 9),
                                            //             // 			decoration: BoxDecoration(shape: BoxShape.circle),
                                            //             // 			child: ClipRRect
                                            //             // 			(
                                            //             // 				borderRadius: BorderRadius.circular(30),
                                            //             // 				child: FadeInImage.assetNetwork
                                            //             // 				(
                                            //             // 					placeholder: "assets/images/logo_splash.png.",
                                            //             // 					fit: BoxFit.fill,
                                            //             // 					image: "https://images.pexels.com/photos/9404642/pexels-photo-9404642.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                            //             // 					// imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.fill),
                                            //             // 				)
                                            //             // 			)
                                            //             // 		)
                                            //             // 	]
                                            //             // )
                                            //             // : Row
                                            //             // (
                                            //             // 	mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                                            //             // 	children:
                                            //             // 	[
                                            //             // 		Container
                                            //             // 		(
                                            //             // 			width: 25,
                                            //             // 			height: 25,
                                            //             // 			margin: EdgeInsets.only(right: 8, bottom: 9),
                                            //             // 			decoration: BoxDecoration
                                            //             // 			(
                                            //             // 				shape: BoxShape.circle,
                                            //             // 				image: DecorationImage
                                            //             // 				(
                                            //             // 					image: AssetImage("assets/images/logo_splash.png"),
                                            //             // 					fit: BoxFit.cover
                                            //             // 				),
                                            //             // 			),
                                            //             // 		),
                                            //             // 		Text
                                            //             // 		(
                                            //             // 			"AppConstants.APP_NAME"
                                            //             // 		)
                                            //             // 	]
                                            //             // ),
                                            //             isMe
                                            //                 ? Column(
                                            //                     crossAxisAlignment: isMe
                                            //                         ? CrossAxisAlignment
                                            //                             .start
                                            //                         : CrossAxisAlignment
                                            //                             .end,
                                            //                     mainAxisSize:
                                            //                         MainAxisSize.min,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment.end,
                                            //                     children: [
                                            //                         SizedBox(width: 8),
                                            //                         Flexible(
                                            //                             child: Container(
                                            //                                 //width: MediaQuery.of(context).size.width / 2,
                                            //                                 child: Column(
                                            //                                     crossAxisAlignment:
                                            //                                         CrossAxisAlignment
                                            //                                             .end,
                                            //                                     children: [
                                            //                               Container(
                                            //                                   decoration:
                                            //                                       BoxDecoration(
                                            //                                     borderRadius:
                                            //                                         BorderRadius
                                            //                                             .circular(5),
                                            //                                     color: Color(
                                            //                                         0xFFECECEC),
                                            //                                   ),
                                            //                                   child: Column(
                                            //                                       crossAxisAlignment:
                                            //                                           CrossAxisAlignment
                                            //                                               .end,
                                            //                                       children: [
                                            //                                         Padding(
                                            //                                           padding: EdgeInsets.symmetric(
                                            //                                               horizontal: 10,
                                            //                                               vertical: 10),
                                            //                                           child:
                                            //                                               Text("chat.message"),
                                            //                                         ),
                                            //                                         // chat.image != null
                                            //                                         // ? ClipRRect
                                            //                                         // (
                                            //                                         // 	borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                            //                                         // 	child: FadeInImage.assetNetwork
                                            //                                         // 	(
                                            //                                         // 		placeholder: Images.placeholder,
                                            //                                         // 		image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.chatImageUrl}/${chat.image}',
                                            //                                         // 		width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth,
                                            //                                         // 		imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
                                            //                                         // 	),
                                            //                                         // )
                                            //                                         // : SizedBox(),
                                            //                                       ]))
                                            //                             ]))),
                                            //                         Text("date"),
                                            //                       ])
                                            //                 : Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize.min,
                                            //                     mainAxisAlignment: isMe
                                            //                         ? MainAxisAlignment.end
                                            //                         : MainAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                         Flexible(
                                            //                             child: Container(
                                            //                                 width: MediaQuery.of(
                                            //                                             context)
                                            //                                         .size
                                            //                                         .width /
                                            //                                     1.4,
                                            //                                 decoration:
                                            //                                     BoxDecoration(
                                            //                                   borderRadius:
                                            //                                       BorderRadius
                                            //                                           .circular(
                                            //                                               5),
                                            //                                   color: AppColors
                                            //                                       .appBarColor,
                                            //                                 ),
                                            //                                 child: Column(
                                            //                                     crossAxisAlignment: isMe
                                            //                                         ? CrossAxisAlignment
                                            //                                             .end
                                            //                                         : CrossAxisAlignment
                                            //                                             .start,
                                            //                                     children: [
                                            //                                       Padding(
                                            //                                           padding: EdgeInsets.symmetric(
                                            //                                               horizontal:
                                            //                                                   10,
                                            //                                               vertical:
                                            //                                                   10),
                                            //                                           child:
                                            //                                               Text(
                                            //                                             "chat.reply",
                                            //                                           ))
                                            //                                     ]))),
                                            //                         SizedBox(width: 8),
                                            //                         Text(
                                            //                           "DateConverter.isoStringToLocalTimeWithAmPmAndDay(chat.createdAt)",
                                            //                         )
                                            //                       ])
                                            //           ]));
                                          })),
                                ]))))
              ])));
  }
  // )
  //       ));
  // }

  getSupportTickets() async {
    print(routeArgs);
    print("ROUTE");
    var response = await Server.ticketDetails(routeArgs);

    print(response);

    if (response != false) {
      _streamController.add(response["ticketDetails"]);

      setState(() {
        // isLoading = false;
      });
    } else {
      // premiumList.length = 0;
    }
  }

  chatBox(
    text,
    isMe,
    // date
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .4),

          // width: MediaQuery.of(context).size.width * .4,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: isMe ? Radius.circular(0) : Radius.circular(15),
                  topLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: isMe ? Colors.blue : Colors.blueGrey),
        ),
        // Text(date)
      ],
    );
  }
}
