import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Old_Architecture/Model/Items_For_SearchDelegate.dart';
import 'package:badges/badges.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:verossa/Old_Architecture/Controller/Global_Methods.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Old_Architecture/Controller/Drawer_Provider.dart';
import 'package:verossa/Old_Architecture/View/Personal_Page.dart';

import 'package:verossa/Injection_Container.dart' as di;

import 'Cart_Badge_Provider.dart';


class CartBadgeWidget extends StatefulWidget  {
  

  @override
  _CartBadgeWidgetState createState() => _CartBadgeWidgetState();
}

class _CartBadgeWidgetState extends State<CartBadgeWidget> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int cartBadgeCount =
        Provider.of<CartBadgeProvider>(context, listen: true).cartBadgeCount;


    bool _showBadge() {
      if (cartBadgeCount > 0) {
        return true;
      }
      return false;
    }


    return ChangeNotifierProvider<CartBadgeProvider>(
        create: (context) => di.sl<CartBadgeProvider>(),
        child: Consumer<CartBadgeProvider>(
            builder: (context, provider, child) => Badge(
              animationType: BadgeAnimationType.scale,
              animationDuration:
              Duration(milliseconds: 300),
              borderRadius: BorderRadius.circular(5),
              badgeColor: Colors.white70,
              shape: BadgeShape.square,
              position:
              BadgePosition.topEnd(top: -2, end: 3),
              showBadge: _showBadge(),
              badgeContent: Text(cartBadgeCount
                  .toString()),

              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )));
  }
}