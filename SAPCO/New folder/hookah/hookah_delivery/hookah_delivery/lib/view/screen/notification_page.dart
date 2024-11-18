import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification')),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: ListTile(
              title: Text('Lorem Ipsum'),
              subtitle: Text('Lorem Ipsum'),
            ),
          );
        },
      ),
    );
  }
}
