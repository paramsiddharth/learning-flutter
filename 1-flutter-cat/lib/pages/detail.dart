import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cat/widgets/themes.dart';
import 'package:flutter_cat/models/catalogue.dart';

class DetailPage extends StatelessWidget {
  final CatalogueItem item;

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            '₹${item.price * 70}'.text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              child: 'Add'.text.make(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColour),
                shape: MaterialStateProperty.all(StadiumBorder())
              ),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColour,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              child: Image.network(item.img),
              tag: Key(item.id.toString()),
            ).h32(context),
            Expanded(child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    item.name.text.xl4.color(MyTheme.darkBluishColour).bold.make(),
                    item.desc.text.xl.textStyle(context.captionStyle!).make(),
                    10.heightBox,
                    'Nostrud dolor anim deserunt eiusmod laborum ea. Esse esse deserunt deserunt Lorem minim enim ea veniam cillum. Proident mollit magna elit minim ex nisi culpa deserunt quis pariatur cillum.'
                    .text.textStyle(context.captionStyle!).make().px24()
                  ],
                ).py64(),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}