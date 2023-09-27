import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Hello There'),
              Image.asset(
                'assets/images/images.jpeg',
                height: 150,
                width: 150,
              ),
              Text(
                'Hello There',
                style: GoogleFonts.habibi(
                    fontSize: 79,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 19.0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Login",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19))))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 19.0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Sign up",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19))))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
