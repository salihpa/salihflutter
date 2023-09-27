import 'package:flutter/material.dart';

class Login_stateful extends StatefulWidget {
  const Login_stateful({super.key});

  @override
  State<Login_stateful> createState() => _Login_statefulState();
}

class _Login_statefulState extends State<Login_stateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'username'),
              validator: (uname) {
                if (uname!.isEmpty ||
                    !uname.contains('@') ||
                    !uname.contains('.com')) {
                  return 'username must not be empty/or invalid';
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(21),
            child: TextFormField(
              validator: (password) {
                if (password!.isEmpty || password.length < 6) {
                  return 'password must not be empty/password length be <=6';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
            ),
          )
        ],
      ),
    );
  }
}
