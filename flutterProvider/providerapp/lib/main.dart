import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/dashboard.dart';
import 'package:providerapp/user.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => User())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final TextEditingController txtUserNameController = TextEditingController();
  final TextEditingController txtUserPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Log"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: txtUserNameController,
                  decoration:
                      const InputDecoration(hintText: "Enter User Name"),
                ),
                TextField(
                  controller: txtUserPwdController,
                  decoration: const InputDecoration(hintText: "Enter Password"),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<User>(context, listen: false).signIn(
                        txtUserNameController.text.toString(),
                        txtUserPwdController.text.toString());
                    Get.to(() => Dashboard());
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
