import 'package:flutter/material.dart';
import 'package:flutter_app/screens/loading_screen.dart';
import 'package:flutter_app/screens/main_screen.dart';

void main () {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}
