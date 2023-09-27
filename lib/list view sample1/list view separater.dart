import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: listview_separater(),
  ));
}

class listview_separater extends StatelessWidget {
  const listview_separater(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("listview_separater"),
        ),
        body: listview_separater(
          itemBuilder: (ctx, i) {
            return const Card(
              child: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.teal,
              ),
            );
          },
          separatorBuilder: (context, index) {
            if (index % 4 == 0) {
              return const Divider(
                color: Colors.red,
                thickness: 3,
              );
            } else {
              return SizedBox();
            }
          },
          itemCount:15),
        );
    // TODO: implement build
    throw UnimplementedError();
  }
}


