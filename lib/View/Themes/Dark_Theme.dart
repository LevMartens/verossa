
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    secondaryHeaderColor: Color.fromRGBO(0, 0, 0, 0.9),
    textTheme: TextTheme(headline6: TextStyle(fontSize: 15, fontFamily: 'SF Pro Display', color: Colors.white60, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.black,
    accentColor: Colors.white,
  );
}