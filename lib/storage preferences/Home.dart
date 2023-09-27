import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Home_Shared(),
  ));
}

class Home_Shared extends StatefulWidget {
  @override
  State<Home_Shared> createState() => _Home_SharedState();
}

class _Home_SharedState extends State<Home_Shared> {
  late SharedPreferences prefs;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    String? uname = prefs.getString('username');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome $uname'),
            SizedBox(
              height: 26,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
