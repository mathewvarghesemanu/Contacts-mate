import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:business_card/HomeScreen.dart';
import 'package:business_card/AddScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    initialRoute: AddScreen().id,
    routes: {
      HomeScreen().id: (context) => HomeScreen(),
      AddScreen().id: (context) => AddScreen(),
    },
  ));
}
