import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final num day = 3;
  final String name = 'Param';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to day ${day.toStringAsFixed(0)} of $name\'s Flutter application!'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}