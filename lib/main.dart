import 'package:flutter/material.dart';
import 'HomePage.dart';

var appStore;
void main() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flitter',
      home: HomePage(),
    );
  }
}
