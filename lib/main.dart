import 'package:flutter/material.dart';
import 'package:flutter_loginpro/login/loginPage.dart';
import 'package:flutter_loginpro/utils/MyRoutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      routes: MyRoutes.routes(),
      initialRoute: MyRoutes.login,
    );
  }
}

class HomePage extends StatelessWidget {
  static var route = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("welcome to homepage"),
    );
  }
}
