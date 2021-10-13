import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cat/widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColour,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.make()
      ),
    );
  }
}