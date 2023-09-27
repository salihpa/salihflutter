import 'package:flutter/material.dart';

class StaggeredGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          child: StaggeredGrid.count(crossAxisCount: 4, children),
        ),
      ),
    );
  }
}
