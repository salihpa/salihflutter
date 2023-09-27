import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView_Builder(),
  ));
}

class ListView_Builder extends StatelessWidget {
  // var images = [
  //   "assets/images/bananas.png",
  //   "assets/images/bibimbap.png",
  //   "assets/images/donut.png",
  //   "assets/images/grapes.png",
  //   "assets/images/hamburger.png",
  //   "assets/images/orange.png",
  //   "assets/images/pineapple.png",
  //   "assets/images/pizza.png",
  //   "assets/images/ramen.png",
  //   "assets/images/salad.png"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView(children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("Hello"),
                  subtitle: Text("My data"),
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.shopping_cart),
                ),
              );
            }),
      ]),
    );
  }
}
