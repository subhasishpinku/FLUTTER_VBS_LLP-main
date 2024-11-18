import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/user.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
          ),
          body: Center(
            child: Text(
              user.email.isNotEmpty
                  ? user.email
                  : 'No email', // Ensure email is not empty before accessing
              style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
            ),
          ),
        );
      },
    );
  }
}
