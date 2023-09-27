import 'package:flutter/material.dart';

class Datastateless extends StatelessWidget {
  String name;
  String? location;
  int phone;
  String img;
  Datastateless(
      {super.key,
      required this.name,
      this.location,
      required this.phone,
      required this.img});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              '$img',
              height: 222,
            ),
            Text(
              "name :$name",
              style: const TextStyle(fontSize: 45),
            ),
            Text(
              "name :$location",
              style: const TextStyle(fontSize: 39),
            ),
            Text(
              "name :$phone",
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
