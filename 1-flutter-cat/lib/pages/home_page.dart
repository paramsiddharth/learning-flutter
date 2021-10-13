import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/services.dart';
import 'package:flutter_cat/models/catalogue.dart';
import 'package:flutter_cat/widgets/home/catalogue/header.dart';
import 'package:flutter_cat/widgets/home/catalogue/list.dart';
import 'package:flutter_cat/widgets/themes.dart';

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
      backgroundColor: MyTheme.creamColour,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if (Catalogue.items != null && Catalogue.items!.isNotEmpty)
                CatalogueList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ],
          )
        ),
      )
    );
  }
}