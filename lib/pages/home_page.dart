import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

//Day 11 learned context and constrain

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Catalog App",
          ),
        ),
        body: Container(
          child: Center(child: Text("welcome to Catalog App")),
        ),
        drawer: MyDrawer());
  }
}
