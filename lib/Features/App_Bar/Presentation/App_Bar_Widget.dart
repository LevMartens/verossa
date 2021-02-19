import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Model/Items_For_SearchDelegate.dart';
import 'package:badges/badges.dart';
import 'package:verossa/Model/Global_Variables.dart';
import 'package:verossa/Controller/Global_Methods.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Controller/Drawer_Provider.dart';
import 'package:verossa/View/Personal_Page.dart';
import 'package:verossa/Features/App_Bar/Presentation/App_Bar_Provider.dart';



class VerossaAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> aScaffoldKey;

  VerossaAppBar({this.aScaffoldKey, Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _VerossaAppBarState createState() => _VerossaAppBarState(aScaffoldKey: aScaffoldKey);
}

class _VerossaAppBarState extends State<VerossaAppBar> {
  final GlobalKey<ScaffoldState> aScaffoldKey;

  _VerossaAppBarState({this.aScaffoldKey});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int cartBadgeCount =
        Provider.of<AppBarProvider>(context, listen: true).cartBadgeCount;


    bool _showBadge() {
      if (cartBadgeCountNoProv > 0) {
        return true;
      }
      return false;
    }


    return ChangeNotifierProvider<DrawerProvider>(
        create: (context) => DrawerProvider(),
        child: Consumer<DrawerProvider>(
            builder: (context, provider, child) => AppBar(

              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: Colors.black,
                ),
                onPressed: () => aScaffoldKey.currentState.openDrawer(),
              ),
              title: Row(
                children: [
                  Text(
                    'MENU',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: <Widget>[
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        aScaffoldKey.currentState.openEndDrawer();
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 160.0),
                            child: Badge(
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
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 0.0, right: 15),
                            child: Text(
                              'CART',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
              titleSpacing: 0.0,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),

            )));
  }
}