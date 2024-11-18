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
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    'https://m.media-amazon.com/images/I/41XzX9DYQWL.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text('Lorem Ipsum'),
                subtitle: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing... '),
                trailing: Text('1m ago'),
              ),
            );
          }),
    );
  }
}
