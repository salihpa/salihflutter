import 'package:flutter/material.dart';

import '../SplashPage.dart';
import '../statefull login.dart';
import 'list view_builder.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppBar1(),
  ));
}

class AppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("whatsapp"),
          actions: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.search_rounded),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("new brodcast")),
                PopupMenuItem(child: Text("new grup")),
                PopupMenuItem(child: Text("Linked devices")),
                PopupMenuItem(child: Text("payments")),
                PopupMenuItem(child: Text("settings")),
              ];
            }),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child:TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
            )
            child: Container(
              child: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.people_rounded),
                ),
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "status",
                ),
                Tab(
                  text: "calls",
                )
              ]),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Login_stateful(),
            ListView_Builder(),
            SplashPage(),
          ],
        ),
      ),
    );
  }
}
