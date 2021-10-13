import 'package:flutter/material.dart';
import 'package:flutter_cat/widgets/home/catalogue/image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cat/widgets/themes.dart';
import 'package:flutter_cat/models/catalogue.dart';

class CatalogueItemView extends StatelessWidget {
  final CatalogueItem item;

  const CatalogueItemView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            child: CatalogueImage(img: item.img),
            tag: Key(item.id.toString()),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.name.text.lg.color(MyTheme.darkBluishColour).bold.make(),
                item.desc.text.textStyle(context.captionStyle!).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.m0,
                  children: [
                    '₹${item.price * 70}'.text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: 'Add'.text.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColour),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ),
                    )
                  ],
                ).pOnly(right: 8)
              ],
            )
          )
        ],
      )
    ).white.roundedLg.clip(Clip.antiAlias).square(150).make().py16();
  }
}