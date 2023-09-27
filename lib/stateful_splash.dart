import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salihflutter/loginpage.dart';

void main() {
  runApp(MaterialApp(
    home: SplashPage(),
  ));
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splash2Page();
}

class Splash2Page extends State {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context as BuildContext).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_Page()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Image(
                image: AssetImage(
                    "assets/images/pngtree-salon-logo-png-image_6872052.png"),
                width: 180,
                height: 180,
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "shmsa",
                  style: GoogleFonts.roboto(
                    color: Colors.red,
                    fontSize: 40,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
