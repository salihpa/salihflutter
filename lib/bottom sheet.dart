import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: bottomsheet(),
  ));
}

class bottomsheet extends StatelessWidget {
  const bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("salihshamsa")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showSheet(context);
          },
          child: Image.network(
              "https://media.istockphoto.com/id/641491966/photo/heart-at-sunset.jpg?s=1024x1024&w=is&k=20&c=BefFdpCIacRNwY5ZLPuN7Hmr3-i4kDRM7BkObr2OL5c="),
        ),
      ),
    );
  }

  void showSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "share through",
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                color: Colors.deepPurpleAccent,
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                title: Text("Whatsapp"),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.pink,
                ),
                title: Text("Instagram"),
              )
            ],
          );
        });
  }
}
