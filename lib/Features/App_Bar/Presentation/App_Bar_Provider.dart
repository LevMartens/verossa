import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

class AppBarProvider extends ChangeNotifier {

  int cartBadgeCount = 0;

  void cartToCart() {
    cartBadgeCount = cartBadgeCountNoProv;
    notifyListeners();
  }
}