import 'package:flutter/material.dart';
import 'package:flutter_demos/NotificationPart2/common/globs.dart';
import 'package:flutter_demos/NotificationPart2/common/push_notification_helper.dart';
import 'package:flutter_demos/main.dart';

import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  userLoginProcess({"user_id": "1", "name": "User 1"});
                },
                child: const Text("User 1 Login")),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  userLoginProcess({"user_id": "2", "name": "User 2"});
                },
                child: const Text("User 2 Login")),
          ],
        ),
      ),
    );
  }

  void userLoginProcess(Map loginPayloadObj) {
    userPayload = loginPayloadObj;
    Globs.udSet(userPayload, Globs.userPayload);
    Globs.udBoolSet(true, Globs.userLogin);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (route) => false);

    if (pushRedirect) {
      pushRedirect = false;
      openNotification(pushPayload);
    }
  }
}
