import 'package:flutter/material.dart';

class Datastatefull extends StatefulWidget {
  String name;
  String? location;
  int phone;
  String img;
  Datastatefull(
      {super.key,
      required this.name,
      this.location,
      required this.phone,
      required this.img});

  @override
  State<Datastatefull> createState() => _DatastatefullState();
}

class _DatastatefullState extends State<Datastatefull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.img,
              height: 222,
            ),
            Text(
              "name :${widget.name}",
              style: const TextStyle(fontSize: 45),
            ),
            Text(
              "name :${widget.location}",
              style: const TextStyle(fontSize: 39),
            ),
            Text(
              "name :${widget.phone}",
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
