import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_cat/models/catalogue.dart';
import 'package:flutter_cat/widgets/drawer.dart';
import 'package:flutter_cat/widgets/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final num day = 3;
  final String name = 'Param';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // Fake network delay
    await Future.delayed(Duration(seconds: 2));
    
    final String catJSON = await rootBundle.loadString('assets/files/catalogue.json');
    final data = jsonDecode(catJSON);
    final products = data['products'];
    
    final List<CatalogueItem> list = List.from(products)
      .map((e) => CatalogueItem.fromMap(e))
      .toList();
    Catalogue.items = list;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: (Catalogue.items != null && Catalogue.items!.isNotEmpty) ? ListView.builder(
          itemCount: Catalogue.items?.length ?? 0,
          itemBuilder: (context, index) => ItemWidget(item: Catalogue.items![index],),
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}