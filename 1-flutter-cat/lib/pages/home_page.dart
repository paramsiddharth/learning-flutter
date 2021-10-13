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
        child: (Catalogue.items != null && Catalogue.items!.isNotEmpty) ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16
          ),
          itemBuilder: (ctx, i) {
            final item = Catalogue.items?[i];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: GridTile(
                header: Container(
                  child: Text(
                    item!.name,
                    style: TextStyle(color: Colors.white)
                  ),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple
                  ),
                ),
                child: Image.network(
                  item.img,
                  fit: BoxFit.fill,
                ),
                footer: Container(
                  child: Text(
                    item.price.toString(),
                    style: TextStyle(color: Colors.white)
                  ),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                ),
              )
            );
          },
          itemCount: Catalogue.items?.length,
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}