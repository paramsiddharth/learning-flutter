import 'package:flutter/material.dart';

import 'package:flutter_cat/models/catalogue.dart';
import 'package:flutter_cat/widgets/drawer.dart';
import 'package:flutter_cat/widgets/item.dart';

class HomePage extends StatelessWidget {
  final num day = 3;
  final String name = 'Param';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          // itemCount: Catalogue.items.length,
          itemCount: 50,
          itemBuilder: (context, index) {
            // return ItemWidget(item: Catalogue.items[index],);
            return ItemWidget(item: List.generate(50, (index) => Catalogue.items[0])[index],);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}