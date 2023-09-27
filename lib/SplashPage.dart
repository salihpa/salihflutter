import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: SplashPage(),
  ));
}

class SplashPage extends StatelessWidget {
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
                  "shamsa",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
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
