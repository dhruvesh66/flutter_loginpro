import 'package:flutter/material.dart';
import 'package:flutter_loginpro/login/loginPage.dart';
import 'package:flutter_loginpro/main.dart';

class MyRoutes {
  static var login = LoginPage.route;
  static var homePage = HomePage.route;
  static Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => LoginPage(),
      homePage: (context) => HomePage(),
    };
  }
}
