import 'package:flutter/material.dart';
import 'package:salihflutter/loginpage1.dart';
import 'package:salihflutter/registrationPage.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage1(),
        '/registration': (context) => registrationPage(),
      },
    );
  }
}
