import 'package:flutter/material.dart';
import 'package:flutter_cat/pages/cart.dart';
import 'package:flutter_cat/widgets/themes.dart';

import 'package:flutter_cat/utils/routes.dart';
import 'package:flutter_cat/pages/login.dart';
import 'package:flutter_cat/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.light(context),
      darkTheme: MyTheme.dark(context),
      initialRoute: MyRoutes.home,
      routes: {
        '/': (ctx) => LoginPage(),
        MyRoutes.home: (ctx) => HomePage(),
        MyRoutes.login: (ctx) => LoginPage(),
        MyRoutes.cart: (ctx) => CartPage(),
      },
    );
  }
}