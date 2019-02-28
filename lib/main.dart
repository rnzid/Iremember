import 'package:flutter/material.dart';
import './ui/pages/home.dart';


void main() =>runApp(App4());

class App4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app4',
      home: HomePage(),

    );
  }
}