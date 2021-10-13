import 'package:flutter/material.dart';
import 'package:flutter_cat/pages/detail_page.dart';

import 'package:flutter_cat/widgets/home/catalogue/item.dart';
import 'package:flutter_cat/models/catalogue.dart';

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalogue.items!.length,
      itemBuilder:  (ctx, i) {
        final item = Catalogue.items?[i];
        return InkWell(
          child: CatalogueItemView(item: item!),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: item))),
        );
      },
    );
  }
}