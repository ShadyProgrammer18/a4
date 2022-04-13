
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String idScreen = "home";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("Home")),
        )),
    );
  }
}