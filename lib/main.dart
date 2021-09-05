import 'package:flutter/material.dart';
import 'package:recipes/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
        primaryColor: Color(0xff263341),
        accentColor: Color(0xff8DB646),
      ),
      home: HomePage(),
    );
  }
}
