import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/Global_Variables.dart';

class DrawerProvider extends ChangeNotifier {

///-------EndDrawer------------------------
  int cartBadgeCount = 0;

  void cartToCart() {
    cartBadgeCount = cartBadgeCountNoProv;
    notifyListeners();
  }

///-------FrontDrawer----------------------
  String name = '';
  Container logOutButton;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> uploadName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  Future<void> getUsersName() async {
    print('getUsersName() called');
    final prefs = await SharedPreferences.getInstance();
    final a = prefs.getString('name');

    if (a == null) {
      name = 'My Account';
    } else {
      name = a;
    }
    notifyListeners();
  }

  Future<void> resetDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'My Account');
    await prefs.setString('street', null);
    await prefs.setString('place', null);
    await prefs.setString('postcode', null);
    getUsersName();
  }

  void getLogOutButton(BuildContext context) async {
    print('getLogOutButton() called');
    if (await auth.currentUser != null) {
      // signed in
      logOutButton = Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () {
              auth.signOut();
              Future.delayed(const Duration(milliseconds: 1000), () {
                resetDetails();


              });



              Navigator.pop(context);
              if (currentlyOnPersonalPage == true) {
              Navigator.of(context)
                  .pushReplacementNamed('homePage');

              }


              scaffoldKey.currentState
                  .showSnackBar(SnackBar(content: Text('Successfully logged out ', textAlign: TextAlign.center,)));
            },
            child: Container(
              height: 40,

              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(

                  'Log Out',
                  style: TextStyle(

                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),

            ),
          ),
        ),
      );
    } else {
      logOutButton = Container();
    }
    notifyListeners();
  }
}
