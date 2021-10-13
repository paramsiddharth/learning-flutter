import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cat/widgets/themes.dart';

class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalogue'.text.xl5.bold.color(MyTheme.darkBluishColour).make(),
        'Trending Products'.text.xl2.make()
      ],
    );
  }
}