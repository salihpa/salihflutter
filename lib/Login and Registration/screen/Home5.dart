import 'package:flutter/material.dart';

class Home5 extends StatelessWidget {
  final data;
  const Home5({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = data[0]['name'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome $name"),
      ),
      body: Center(
        child: Text('Success'),
      ),
    );
  }
}
