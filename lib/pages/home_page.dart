import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/itemWidget.dart';

//Day 11 learned context and constrain

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemList = List.generate(20, (index) => CatalogModel.products[0]);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Catalog App",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: itemList[index]);
              }),
        ),
        drawer: MyDrawer());
  }
}
