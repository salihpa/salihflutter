import 'package:flutter/material.dart';
import 'package:salihflutter/passing%20data%20btween%20screens/using%20navigator/dummydata.dart';
import 'package:salihflutter/using%20constructor/stateful.dart';

import '../using constructor/stateless.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage2(),
  ));
}

class MainPage2 extends StatelessWidget {
  const MainPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data passing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Datastateless(
                        name: "salih",
                        location: "uc",
                        phone: 1234,
                        img: products[0]['image']))),
                child: Text("to stateless")),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Datastatefull(
                        name: "salih",
                        location: "uc",
                        phone: 1234,
                        img: products[0]['image']))),
                child: Text("to statefull")),
          ],
        ),
      ),
    );
  }
}
