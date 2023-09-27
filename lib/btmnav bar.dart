import 'package:flutter/material.dart';

class btmbar extends StatefulWidget {
  @override
  State<btmbar> createState() => _btmbarState();
}

class _btmbarState extends State<btmbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.yellow,
          currentIndex: index,
          OnTap),
    );
  }
}
