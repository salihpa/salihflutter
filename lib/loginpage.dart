import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salihflutter/registrationPage.dart';
import 'package:salihflutter/storage%20preferences/sqflite%20crud/sqlflite_contact_book.dart';

import 'home.dart';

//

class Login_Page extends StatelessWidget {
  String username = "admin@gmail.com";
  String password = 'abc123';

  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/pngtree-salon-logo-png-image_6872052.png",
              height: 100,
              width: 100,
            ),
            Text(
              "Shams",
              style: GoogleFonts.daiBannaSil(
                  fontSize: 79,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: TextField(
                controller: uname_controller,
                decoration: const InputDecoration(
                    hintText: "UserName",
                    labelText: "UserName",
                    helperText: 'UserName Must be an Email',
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            // SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '&',
                controller: pass_controller,
                decoration: const InputDecoration(
                    hintText: "PassWord",
                    labelText: "PassWord",
                    helperText: 'Password Must Contain 6 characters',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  //String userip = uname_controller.text;
                  if (username == uname_controller.text &&
                      password == pass_controller.text) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Invalid username/ Password or the Fields are empty'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationPage()));
                },
                child: const Text('Not a User? SignUp Here!!!!'))
          ],
        ),
      ),
    );
  }
}

/// image widgets
/// Image(image:)
/// Image.asset()
/// Image.network()
