import 'package:flutter/widgets.dart';
import 'package:beautifullui/app/app.dart';
import 'package:beautifullui/home/home.dart';
import 'package:beautifullui/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
