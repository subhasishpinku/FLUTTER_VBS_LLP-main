import 'package:flutter/material.dart';
import 'package:flutter_demos/NotificationPart2/common/globs.dart';
import 'package:flutter_demos/NotificationPart2/view/login_view.dart';
import 'package:flutter_demos/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var userName = userPayload["name"] as String? ?? "no name set";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("login by $userName"),
          const Text("Push Notification Demo"),
          TextButton(
              onPressed: () {
                Globs.udBoolSet(false, Globs.userLogin);
                userPayload = {};
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (route) => false);
              },
              child: const Text("Logout"))
        ],
      )),
    );
  }
}
