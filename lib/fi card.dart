import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(MaterialApp(
    home: Ficard(),
  ));
}

class Ficard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.teal),
            ),
            Positioned(
                top: 80,
                left: 35,
                child: Row(
                  children: [
                    Transform.rotate(
                      angle: 90 * pi / 180,
                      child: FaIcon(
                        FontAwesomeIcons.simCard,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Transform.rotate(
                      angle: 90 * pi / 180,
                      child: const FaIcon(
                        size: 25,
                        FontAwesomeIcons.wifi,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )),
            Positioned(
              bottom: 15,
              left: 20,
              child: Text(
                'Mohammed Salih',
                style: GoogleFonts.aBeeZee(color: Colors.white70),
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  "VISA",
                  style: GoogleFonts.abhayaLibre(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.grey),
                )),
            Positioned(
                top: 10,
                right: 20,
                child: GradientText(
                  "Fi",
                  style: GoogleFonts.beVietnamPro(
                      fontWeight: FontWeight.bold, fontSize: 30),
                  colors: [Colors.white, Colors.black38, Colors.black12],
                  stops: [0, .3, 1],
                ))
          ],
        ),
      ),
    );
  }
}
