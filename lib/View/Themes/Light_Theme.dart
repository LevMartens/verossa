import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: Color.fromRGBO(255, 255, 255, 0.9),
    textTheme: TextTheme(headline6: TextStyle(fontSize: 15, fontFamily: 'SF Pro Display', color: Colors.white60, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.white,
    accentColor: Colors.black,
  );
}

//