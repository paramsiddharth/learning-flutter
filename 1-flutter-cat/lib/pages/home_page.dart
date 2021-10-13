import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cat/models/catalogue.dart';
import 'package:flutter_cat/widgets/drawer.dart';
import 'package:flutter_cat/widgets/item.dart';
import 'package:flutter_cat/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
                CatalogueList().expand()
              else
                Center(child: CircularProgressIndicator())
            ],
          )
        ),
      )
    );
  }
}

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

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalogue.items!.length,
      itemBuilder:  (ctx, i) {
        final item = Catalogue.items?[i];
        return CatalogueItemView(item: item!);
      },
    );
  }
}

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
          CatalogueImage(img: item.img),
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
                      child: 'Buy'.text.make(),
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

class CatalogueImage extends StatelessWidget {
  final String img;

  const CatalogueImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(img).box.rounded.p8.color(MyTheme.creamColour).make().p16().w40(context);
  }
}