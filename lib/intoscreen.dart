import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salihflutter/stateful_splash.dart';
import '';

void main() {
  runApp(MaterialApp(
    home: IntroScreen(),
  ));
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageDecoration decorationPage = PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        bodyTextStyle: TextStyle(
            fontSize: 23, fontStyle: FontStyle.italic, color: Colors.brown),
        boxDecoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white70, Colors.yellow, Colors.orangeAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ));

    return IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'fisrt page',
              body: "indroduction/onbody",
              image: IntroImage(
                  "https://media.istockphoto.com/id/1127245421/photo/woman-hands-praying-for-blessing-from-god-on-sunset-background.jpg?s=612x612&w=0&k=20&c=dTR8aj0xt7DLhxS9vogRbwY8VIg9U4AzkpB_iTTyr10=")),
          PageViewModel(
              title: 'second page',
              body: "indroduction/onbody",
              image: IntroImage(
                  "https://media.istockphoto.com/id/496261146/photo/young-man-at-sunset.jpg?s=612x612&w=0&k=20&c=tAmNKSqvs9r2jnvWZ6uGs9NAROY7mYP-ZqXXEm9eF8A=")),
          PageViewModel(
              title: 'third page',
              body: "indroduction/onbody",
              image: IntroImage(
                  "https://media.istockphoto.com/id/1322104312/photo/freedom-chains-that-transform-into-birds-charge-concept.jpg?s=612x612&w=0&k=20&c=e2XUx498GotTLJn_62tPmsqj6vU48ZEkf0auXi6Ywh0=")),
        ],
        onSkip: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SplashPage()),
            ),
        onDone: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SplashPage()),
            ),
        showSkipButton: true,
        skip: Text('skip'),
        next: Icon(Icons.arrow_back),
        done: Text('done'),
        dotsDecorator: DotsDecorator(
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(23))),
            size: Size(12, 10),
            activeSize: Size(12, 10),
            activeColor: Colors.green));
  }

  Widget IntroImage(String imgpath) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(),
      ),
    );
  }
}
