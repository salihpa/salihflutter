import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(
    home: Login_Shared(),
  ));
}

class Login_Shared extends StatefulWidget {
  @override
  State<Login_Shared> createState() => _Login_SharedState();
}

class _Login_SharedState extends State<Login_Shared> {
  final userName = TextEditingController();
  final passWord = TextEditingController();
  late bool newUser;
  late SharedPreferences prefs;

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }

  void check_user_already_login() async {
    prefs = await SharedPreferences.getInstance();
    newUser = prefs.getBool('first login') ?? true;

    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Shared()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        children: [
          TextField(
            controller: userName,
            decoration: InputDecoration(
                hintText: "UserName", border: OutlineInputBorder()),
          ),
          TextField(
            controller: passWord,
            decoration: InputDecoration(
                hintText: "Password", border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () async {
                prefs = await SharedPreferences.getInstance();
                String uname = userName.text.trim();
                String pass = passWord.text.trim();

                if (uname != '' && pass != '') {
                  prefs.setString('username', uname);
                  prefs.setString('password', pass);
                  prefs.setBool('firstlogin', false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Home_Shared()));
                }
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
