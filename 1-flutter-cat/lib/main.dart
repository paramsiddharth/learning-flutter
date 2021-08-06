import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_cat/utils/routes.dart';
import 'package:flutter_cat/pages/login_page.dart';
import 'package:flutter_cat/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (ctx) => HomePage(),
        MyRoutes.login: (ctx) => LoginPage()
      },
    );
  }
}