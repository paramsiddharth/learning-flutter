import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cat/widgets/themes.dart';

class CatalogueImage extends StatelessWidget {
  final String img;

  const CatalogueImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(img).box.rounded.p8.color(MyTheme.creamColour).make().p16().w40(context);
  }
}