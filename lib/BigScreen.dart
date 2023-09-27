import 'package:flutter/material.dart';

class BigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[200],
      appBar: AppBar(
        title: Text("S H A M S A"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 16 / 4,
                child: Container(
                  color: Colors.orange[350],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      color: Colors.deepPurpleAccent,
                      height: 120,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 200,
                color: Colors.deepOrange[300],
              ),
            )
          ],
        ),
      ),
    );
  }
}
