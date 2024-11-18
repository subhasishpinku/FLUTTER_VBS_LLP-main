import 'package:flutter/material.dart';
import 'package:flutter_demos/NotificationPart2/view/home_view.dart';
import 'package:flutter_demos/NotificationPart2/view/login_view.dart';
import 'package:flutter_demos/main.dart';

import '../common/globs.dart';
import '../common/push_notification_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    loadNextAppScreen();
  }

  loadNextAppScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    loadScreen();
    await PushNotificationHelper.initialized();
  }

  void loadScreen() {
    if (Globs.udValueBool(Globs.userLogin)) {
      userPayload = Globs.udValue(Globs.userPayload);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.apps,
          size: 100,
        ),
      ),
    );
  }
}
