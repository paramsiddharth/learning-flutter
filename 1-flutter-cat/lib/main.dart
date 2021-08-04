import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: '/home',
      routes: {
        '/home': (ctx) => HomePage(),
        '/login': (ctx) => LoginPage()
      },
    );
  }
}