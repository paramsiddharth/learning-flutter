import 'package:flutter/material.dart';

import 'package:flutter_cat/models/catalogue.dart';

class ItemWidget extends StatelessWidget {
  final CatalogueItem item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print(item.name);
        },
        leading: Image.network(item.img),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          '₹${item.price * 70}',
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}