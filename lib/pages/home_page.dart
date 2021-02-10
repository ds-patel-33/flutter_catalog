import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog App"),
      ),
      body: Container(
        child: Center(child: Text("welcome to Catalog App")),
      ),
      drawer: Drawer(),
    );
  }
}
