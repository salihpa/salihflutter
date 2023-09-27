import 'package:flutter/material.dart';

class StaggeredGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text("sssss"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 5,
          children:[
            StaggeredGridTile.count(
              crossAxisCellCount:4,
              mainAxisCellCount:1,
              child:Card(
                color: Colors.cyan,
                child: Center(
                  child: Icon(Icons.account_balance),
                ),
              )),
         StaggeredGrid.count(
            crossAxisCount: 5,
            children:[
            StaggeredGridTile.count(
            crossAxisCellCount:4,
            mainAxisCellCount:1,
            child:Card(
              color: Colors.cyan,
              child: Center(
                child: Icon(Icons.account_balance),
              ),
            )),
         StaggeredGrid.count(
            crossAxisCount: 5,
            children:[
            StaggeredGridTile.count(
            crossAxisCellCount:4,
            mainAxisCellCount:1,
            child:Card(
              color: Colors.cyan,
              child: Center(
                child: Icon(Icons.account_balance),
              ),
            )),
            )
          ]

      ),
  ]
    ))
  }
}
